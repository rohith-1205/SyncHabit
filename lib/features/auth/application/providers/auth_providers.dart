import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/services/firebase_providers.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../infrastructure/models/user_model.dart';
import '../../infrastructure/repositories/firebase_auth_repository.dart';
import '../controllers/auth_controller.dart';

final authRepositoryInterfaceProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepositoryImpl(
    ref.watch(firebaseAuthProvider),
    ref.watch(firebaseFirestoreProvider),
    ref.watch(googleSignInProvider),
  );
});

final authStateProvider = StreamProvider<UserModel?>((ref) {
  final repo = ref.watch(authRepositoryInterfaceProvider);
  return repo.authStateChanges.map((entity) => entity != null ? UserModel.fromEntity(entity) : null);
});

final authNotifierProvider = StateNotifierProvider<AuthController, AsyncValue<UserModel?>>((ref) {
  return AuthController(
    ref.watch(authRepositoryInterfaceProvider),
    ref.watch(appConfigProvider),
    ref.watch(appLoggerProvider),
  );
});

final currentUserProvider = Provider<UserModel?>((ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.hasValue ? authState.value : null;
});

// Legacy repository provider alias for backward compatibility
final authRepositoryProvider = Provider<dynamic>((ref) {
  return ref.watch(authRepositoryInterfaceProvider);
});
