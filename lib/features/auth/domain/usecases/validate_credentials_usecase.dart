import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';
import 'package:banking_flutter_app/features/auth/domain/repositories/auth_repository.dart';

class ValidateCredentialsUseCase {
  final AuthRepository _authRepository;

  const ValidateCredentialsUseCase(this._authRepository);

  /// Valida las credenciales de un usuario
  /// Retorna el usuario si las credenciales son válidas, null si no lo son
  Future<User?> call(String email, String password) async {
    return await _authRepository.validateCredentials(email, password);
  }
} 