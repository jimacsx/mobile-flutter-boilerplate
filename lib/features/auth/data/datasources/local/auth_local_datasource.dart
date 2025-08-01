import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';

abstract class AuthLocalDataSource {
  /// Guarda el usuario actual en el almacenamiento local
  Future<void> saveCurrentUser(User user);
  
  /// Obtiene el usuario actual del almacenamiento local
  Future<User?> getCurrentUser();
  
  /// Elimina el usuario actual del almacenamiento local
  Future<void> clearCurrentUser();
  
  /// Verifica si hay un usuario autenticado
  Future<bool> isAuthenticated();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  User? _currentUser;

  @override
  Future<void> saveCurrentUser(User user) async {
    // Simular delay de almacenamiento local
    await Future.delayed(const Duration(milliseconds: 100));
    _currentUser = user;
  }

  @override
  Future<User?> getCurrentUser() async {
    // Simular delay de lectura local
    await Future.delayed(const Duration(milliseconds: 50));
    return _currentUser;
  }

  @override
  Future<void> clearCurrentUser() async {
    // Simular delay de limpieza local
    await Future.delayed(const Duration(milliseconds: 50));
    _currentUser = null;
  }

  @override
  Future<bool> isAuthenticated() async {
    final user = await getCurrentUser();
    return user != null;
  }
} 