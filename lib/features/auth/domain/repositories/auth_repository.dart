import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  /// Valida si un email existe en el sistema
  /// Retorna el usuario si existe, null si no existe
  Future<User?> validateEmail(String email);
  
  /// Valida las credenciales de un usuario
  /// Retorna el usuario si las credenciales son válidas, null si no lo son
  Future<User?> validateCredentials(String email, String password);
  
  /// Obtiene el usuario actual
  Future<User?> getCurrentUser();
  
  /// Cierra la sesión del usuario actual
  Future<void> logout();
} 