import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';
import 'package:banking_flutter_app/features/auth/domain/repositories/auth_repository.dart';

class ValidateEmailUseCase {
  final AuthRepository _authRepository;

  const ValidateEmailUseCase(this._authRepository);

  /// Valida si un email existe en el sistema
  /// Retorna el usuario si existe, null si no existe
  Future<User?> call(String email) async {
    return await _authRepository.validateEmail(email);
  }
} 