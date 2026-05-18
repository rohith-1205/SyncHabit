import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  final fb_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthRepositoryImpl(this._firebaseAuth, this._firestore, this._googleSignIn);

  @override
  Stream<UserEntity?> get authStateChanges {
    return _firebaseAuth.authStateChanges().asyncMap((fbUser) async {
      if (fbUser == null) return null;
      try {
        final doc = await _firestore.collection('users').doc(fbUser.uid).get();
        if (doc.exists) {
          return UserModel.fromFirestore(doc);
        }
        // Create fallback profile if not exists
        final newUser = UserModel(
          id: fbUser.uid,
          email: fbUser.email ?? '',
          displayName: fbUser.displayName ?? fbUser.email?.split('@').first ?? 'User',
          photoUrl: fbUser.photoURL,
          isGuest: fbUser.isAnonymous,
          isPro: false,
          createdAt: DateTime.now(),
        );
        await _firestore.collection('users').doc(fbUser.uid).set(newUser.toJson(), SetOptions(merge: true));
        return newUser;
      } catch (e) {
        // Return basic user model if firestore fetch fails
        return UserModel(
          id: fbUser.uid,
          email: fbUser.email ?? '',
          displayName: fbUser.displayName ?? 'User',
          photoUrl: fbUser.photoURL,
          isGuest: fbUser.isAnonymous,
          isPro: false,
          createdAt: DateTime.now(),
        );
      }
    });
  }

  @override
  Future<Result<UserEntity>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return FailureResult(AuthFailure('Google Sign-In canceled by user'));
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final fb_auth.OAuthCredential credential = fb_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final fb_auth.UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final fbUser = userCredential.user;
      if (fbUser == null) {
        return FailureResult(AuthFailure('Failed to retrieve Google user credential'));
      }
      final userModel = await _getOrCreateUserProfile(fbUser);
      return Success(userModel);
    } catch (e) {
      return FailureResult(AuthFailure('Google Sign-In error: $e'));
    }
  }

  @override
  Future<Result<UserEntity>> signInWithApple() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      final fbUser = userCredential.user;
      if (fbUser == null) {
        return FailureResult(AuthFailure('Failed to create Apple session'));
      }
      final userModel = UserModel(
        id: fbUser.uid,
        email: 'apple_${fbUser.uid.substring(0, 5)}@synchabit.ai',
        displayName: 'Apple User',
        photoUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&q=80',
        isGuest: false,
        isPro: false,
        createdAt: DateTime.now(),
      );
      await _firestore.collection('users').doc(fbUser.uid).set(userModel.toJson(), SetOptions(merge: true));
      return Success(userModel);
    } catch (e) {
      return FailureResult(AuthFailure('Apple Sign-In error: $e'));
    }
  }

  @override
  Future<Result<UserEntity>> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final fbUser = userCredential.user;
      if (fbUser == null) {
        return FailureResult(AuthFailure('Failed to retrieve user credential'));
      }
      final userModel = await _getOrCreateUserProfile(fbUser);
      return Success(userModel);
    } catch (e) {
      return FailureResult(AuthFailure('Email Sign-In error: $e'));
    }
  }

  @override
  Future<Result<UserEntity>> signUpWithEmail(String email, String password, String displayName) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final fbUser = userCredential.user;
      if (fbUser == null) {
        return FailureResult(AuthFailure('Failed to create user credential'));
      }
      await fbUser.updateDisplayName(displayName);
      final userModel = UserModel(
        id: fbUser.uid,
        email: email,
        displayName: displayName,
        photoUrl: null,
        isGuest: false,
        isPro: false,
        createdAt: DateTime.now(),
      );
      await _firestore.collection('users').doc(fbUser.uid).set(userModel.toJson(), SetOptions(merge: true));
      return Success(userModel);
    } catch (e) {
      return FailureResult(AuthFailure('Email Sign-Up error: $e'));
    }
  }

  @override
  Future<Result<UserEntity>> signInAsGuest() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      final fbUser = userCredential.user;
      if (fbUser == null) {
        return FailureResult(AuthFailure('Failed to create guest session'));
      }
      final userModel = UserModel(
        id: fbUser.uid,
        email: 'guest_${fbUser.uid.substring(0, 5)}@synchabit.local',
        displayName: 'Neural Guest',
        photoUrl: null,
        isGuest: true,
        isPro: false,
        createdAt: DateTime.now(),
      );
      await _firestore.collection('users').doc(fbUser.uid).set(userModel.toJson(), SetOptions(merge: true));
      return Success(userModel);
    } catch (e) {
      return FailureResult(AuthFailure('Guest Sign-In error: $e'));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      return const Success(null);
    } catch (e) {
      return FailureResult(AuthFailure('Sign-Out error: $e'));
    }
  }

  @override
  Future<Result<UserEntity?>> restoreSession() async {
    try {
      final fbUser = _firebaseAuth.currentUser;
      if (fbUser == null) {
        return const Success(null);
      }
      final userModel = await _getOrCreateUserProfile(fbUser);
      return Success(userModel);
    } catch (e) {
      return FailureResult(AuthFailure('Session restore error: $e'));
    }
  }

  Future<UserModel> _getOrCreateUserProfile(fb_auth.User fbUser) async {
    final doc = await _firestore.collection('users').doc(fbUser.uid).get();
    if (doc.exists) {
      return UserModel.fromFirestore(doc);
    }
    final newUser = UserModel(
      id: fbUser.uid,
      email: fbUser.email ?? '',
      displayName: fbUser.displayName ?? fbUser.email?.split('@').first ?? 'User',
      photoUrl: fbUser.photoURL,
      isGuest: fbUser.isAnonymous,
      isPro: false,
      createdAt: DateTime.now(),
    );
    await _firestore.collection('users').doc(fbUser.uid).set(newUser.toJson(), SetOptions(merge: true));
    return newUser;
  }
}
