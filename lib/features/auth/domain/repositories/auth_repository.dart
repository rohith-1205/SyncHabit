import '../../../../core/utils/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Stream<UserEntity?> get authStateChanges;
  Future<Result<UserEntity>> signInWithGoogle();
  Future<Result<UserEntity>> signInWithApple();
  Future<Result<UserEntity>> signInWithEmail(String email, String password);
  Future<Result<UserEntity>> signUpWithEmail(String email, String password, String displayName);
  Future<Result<UserEntity>> signInAsGuest();
  Future<Result<void>> signOut();
  Future<Result<UserEntity?>> restoreSession();
}
