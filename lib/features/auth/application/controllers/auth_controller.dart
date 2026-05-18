import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../infrastructure/models/user_model.dart';

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository _repository;
  final AppConfig _config;
  final AppLogger _logger;

  AuthController(this._repository, this._config, this._logger) : super(const AsyncValue.data(null)) {
    _logger.info('AuthController initialized in ${_config.environment.name} mode');
    restoreSession();
  }

  Future<void> restoreSession() async {
    state = const AsyncValue.loading();
    final result = await _repository.restoreSession();
    result.fold(
      (failure) {
        _logger.error('Session restore failed', failure);
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        _logger.info('Session restored: ${user?.email}');
        state = AsyncValue.data(user as UserModel?);
      },
    );
  }

  Future<void> loginWithGoogle() async {
    _logger.info('Initiating Google Login');
    state = const AsyncValue.loading();
    final result = await _repository.signInWithGoogle();
    result.fold(
      (failure) {
        _logger.error('Google Login failed', failure);
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        _logger.info('Google Login successful: ${user.email}');
        state = AsyncValue.data(user as UserModel);
      },
    );
  }

  Future<void> loginWithApple() async {
    _logger.info('Initiating Apple Login');
    state = const AsyncValue.loading();
    final result = await _repository.signInWithApple();
    result.fold(
      (failure) {
        _logger.error('Apple Login failed', failure);
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        _logger.info('Apple Login successful: ${user.email}');
        state = AsyncValue.data(user as UserModel);
      },
    );
  }

  Future<void> loginWithEmail(String email, String password) async {
    _logger.info('Initiating Email Login for $email');
    state = const AsyncValue.loading();
    final result = await _repository.signInWithEmail(email, password);
    result.fold(
      (failure) {
        _logger.error('Email Login failed', failure);
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        _logger.info('Email Login successful: ${user.email}');
        state = AsyncValue.data(user as UserModel);
      },
    );
  }

  Future<void> signUpWithEmail(String email, String password, String displayName) async {
    _logger.info('Initiating Email Sign-Up for $email');
    state = const AsyncValue.loading();
    final result = await _repository.signUpWithEmail(email, password, displayName);
    result.fold(
      (failure) {
        _logger.error('Email Sign-Up failed', failure);
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        _logger.info('Email Sign-Up successful: ${user.email}');
        state = AsyncValue.data(user as UserModel);
      },
    );
  }

  Future<void> loginAsGuest() async {
    _logger.info('Initiating Guest Login');
    state = const AsyncValue.loading();
    final result = await _repository.signInAsGuest();
    result.fold(
      (failure) {
        _logger.error('Guest Login failed', failure);
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (user) {
        _logger.info('Guest Login successful: ${user.id}');
        state = AsyncValue.data(user as UserModel);
      },
    );
  }

  Future<void> logout() async {
    _logger.info('Logging out user');
    state = const AsyncValue.loading();
    await _repository.signOut();
    state = const AsyncValue.data(null);
  }

  void upgradeToPro() {
    _logger.info('Upgrading user to Pro status');
    if (state.value != null) {
      state = AsyncValue.data((state.value as UserModel).copyWith(isPro: true));
    }
  }
}
