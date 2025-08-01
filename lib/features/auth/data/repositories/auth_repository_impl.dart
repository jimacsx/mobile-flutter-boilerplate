import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';
import 'package:banking_flutter_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:banking_flutter_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:banking_flutter_app/features/auth/data/datasources/local/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  const AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<User?> validateEmail(String email) async {
    try {
      return await _remoteDataSource.validateEmail(email);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> validateCredentials(String email, String password) async {
    try {
      final user = await _remoteDataSource.validateCredentials(email, password);
      
      if (user != null) {
        // Guardar usuario en almacenamiento local
        await _localDataSource.saveCurrentUser(user);
      }
      
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      return await _localDataSource.getCurrentUser();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _localDataSource.clearCurrentUser();
    } catch (e) {
      // Manejar error de logout si es necesario
    }
  }
} 