import 'package:uuid/uuid.dart';
import '../models/user_model.dart';

class AuthRepository {
  final Uuid _uuid = const Uuid();

  Future<UserModel> signInWithGoogle() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return UserModel(
      id: _uuid.v4(),
      email: 'alex.mercer@synchabit.ai',
      displayName: 'Alex Mercer',
      photoUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80',
      isGuest: false,
      isPro: true, // Let's mock pro for premium feel
    );
  }

  Future<UserModel> signInWithApple() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return UserModel(
      id: _uuid.v4(),
      email: 'apple.user@synchabit.ai',
      displayName: 'Apple User',
      photoUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&q=80',
      isGuest: false,
      isPro: false,
    );
  }

  Future<UserModel> signInWithEmail(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return UserModel(
      id: _uuid.v4(),
      email: email,
      displayName: email.split('@').first.toUpperCase(),
      isGuest: false,
      isPro: false,
    );
  }

  Future<UserModel> signInAsGuest() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserModel(
      id: 'guest_${_uuid.v4()}',
      email: 'guest@synchabit.local',
      displayName: 'Neural Guest',
      isGuest: true,
      isPro: false,
    );
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 400));
  }
}
