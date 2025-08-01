import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  /// Valida si un email existe en el sistema
  Future<User?> validateEmail(String email);
  
  /// Valida las credenciales de un usuario
  Future<User?> validateCredentials(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Mock de usuarios para pruebas con nombres mexicanos
  static final List<User> _mockUsers = [
    User(
      id: '1',
      email: 'juan.perez@example.com',
      username: 'juanperez',
      firstName: 'Juan',
      secondName: 'Carlos',
      paternalLastName: 'Pérez',
      maternalLastName: 'García',
      createdAt: DateTime(2023, 1, 15),
      isActive: true,
      lastLoginAt: DateTime(2024, 1, 10, 14, 30),
      phoneNumber: '+52 55 1234 5678',
      accountNumber: '**** 1550',
    ),
    User(
      id: '2',
      email: 'maria.gonzalez@example.com',
      username: 'mariagonzalez',
      firstName: 'María',
      secondName: null,
      paternalLastName: 'González',
      maternalLastName: 'López',
      createdAt: DateTime(2023, 3, 22),
      isActive: true,
      lastLoginAt: DateTime(2024, 1, 12, 9, 15),
      phoneNumber: '+52 81 9876 5432',
      accountNumber: '**** 2347',
    ),
    User(
      id: '3',
      email: 'roberto.rodriguez@example.com',
      username: 'robertorodriguez',
      firstName: 'Roberto',
      secondName: 'Alejandro',
      paternalLastName: 'Rodríguez',
      maternalLastName: 'Martínez',
      createdAt: DateTime(2023, 6, 8),
      isActive: true,
      lastLoginAt: DateTime(2024, 1, 8, 16, 45),
      phoneNumber: '+52 33 4567 8901',
      accountNumber: '**** 3891',
    ),
  ];

  // Mock de contraseñas (en un caso real esto estaría en una base de datos segura)
  // Las contraseñas cumplen con: longitud mínima 6, al menos un dígito o carácter especial,
  // al menos una mayúscula y una minúscula, sin puntos ni saltos de línea
  static const Map<String, String> _mockPasswords = {
    'juan.perez@example.com': 'SecurePass123',
    'maria.gonzalez@example.com': 'StrongPwd456',
    'roberto.rodriguez@example.com': 'RobustPass789',
  };

  @override
  Future<User?> validateEmail(String email) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 800));
    
    try {
      return _mockUsers.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> validateCredentials(String email, String password) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 800));
    
    try {
      final user = _mockUsers.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      );
      
      final storedPassword = _mockPasswords[user.email];
      
      if (storedPassword == password) {
        // Actualizar último login
        return user.copyWith(
          lastLoginAt: DateTime.now(),
        );
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }
} 