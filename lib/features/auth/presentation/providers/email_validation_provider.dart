import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/features/auth/domain/entities/user.dart';
import 'package:banking_flutter_app/features/auth/presentation/providers/auth_provider.dart';

// Estado para la validación del email
class EmailValidationState {
  final bool isLoading;
  final User? validatedUser;
  final String? errorMessage;

  const EmailValidationState({
    this.isLoading = false,
    this.validatedUser,
    this.errorMessage,
  });

  EmailValidationState copyWith({
    bool? isLoading,
    User? validatedUser,
    String? errorMessage,
  }) {
    return EmailValidationState(
      isLoading: isLoading ?? this.isLoading,
      validatedUser: validatedUser ?? this.validatedUser,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Notifier para manejar la validación del email
class EmailValidationNotifier extends StateNotifier<EmailValidationState> {
  final AuthNotifier _authNotifier;

  EmailValidationNotifier(this._authNotifier) : super(const EmailValidationState());

  Future<void> validateEmail(String email) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await _authNotifier.validateEmail(email);
      
      if (user != null) {
        state = state.copyWith(
          isLoading: false,
          validatedUser: user,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'El email no está registrado en el sistema',
        );
      }
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error al validar el email',
      );
    }
  }

  void clearValidation() {
    state = const EmailValidationState();
  }
}

// Provider para la validación del email
final emailValidationProvider = StateNotifierProvider<EmailValidationNotifier, EmailValidationState>((ref) {
  final authNotifier = ref.watch(currentUserProvider.notifier);
  return EmailValidationNotifier(authNotifier);
}); 