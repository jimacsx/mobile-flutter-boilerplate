import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';
import 'package:banking_flutter_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:banking_flutter_app/features/auth/domain/usecases/usecases.dart';
import 'package:banking_flutter_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:banking_flutter_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:banking_flutter_app/features/auth/data/datasources/local/auth_local_datasource.dart';

// Providers para los datasources
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl();
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl();
});

// Provider para el repositorio
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource, localDataSource);
});

// Providers para los casos de uso
final validateEmailUseCaseProvider = Provider<ValidateEmailUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ValidateEmailUseCase(repository);
});

final validateCredentialsUseCaseProvider = Provider<ValidateCredentialsUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ValidateCredentialsUseCase(repository);
});

// Provider para el usuario actual
final currentUserProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});

// Provider para el estado de login
final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

// Estado para el proceso de login
class LoginState {
  final bool isLoading;
  final String? errorMessage;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Notifier para manejar el estado de login
class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String errorMessage) {
    state = state.copyWith(isLoading: false, errorMessage: errorMessage);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

// Notifier para manejar el estado de autenticación
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.loading()) {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    try {
      state = const AsyncValue.loading();
      final user = await _repository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<User?> validateEmail(String email) async {
    try {
      final validateEmailUseCase = ValidateEmailUseCase(_repository);
      return await validateEmailUseCase(email);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  Future<User?> validateCredentials(String email, String password) async {
    try {
      final validateCredentialsUseCase = ValidateCredentialsUseCase(_repository);
      final user = await validateCredentialsUseCase(email, password);
      
      if (user != null) {
        state = AsyncValue.data(user);
      }
      
      return user;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
} 