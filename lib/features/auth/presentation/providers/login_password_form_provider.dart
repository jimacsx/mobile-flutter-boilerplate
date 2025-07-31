import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';

// * 3 - StateNotifierProvider - consumed externally - (How are we going to consume this provider?)
final loginPasswordFormProvider = StateNotifierProvider.autoDispose<
  LoginPasswordFormNotifier,
  LoginPasswordFormState
>((ref) {
  return LoginPasswordFormNotifier();
});

// * 2 - How we implement a notifier
class LoginPasswordFormNotifier extends StateNotifier<LoginPasswordFormState> {
  LoginPasswordFormNotifier() : super(LoginPasswordFormState());

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword]),
    );
  }

  onFormSubmit() {
    _touchEveryField();
    if (!state.isValid) return;

    // print: call the overridden toString method
    print(state);
  }

  // To touch each field and be able to trigger input validations
  _touchEveryField() {
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      password: password,
      isValid: Formz.validate([password]),
    );
  }
}

// * 1 - create provider state (StateNotifierProvider)
class LoginPasswordFormState {
  final bool isPosting; // for when the transaction is made and is asynchronous
  final bool isFormPosted; // when the user clicks the submit button
  final bool isValid;
  final Password password;

  LoginPasswordFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.password = const Password.pure(),
  });

  LoginPasswordFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Password? password,
  }) => LoginPasswordFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    password: password ?? this.password,
  );

  @override
  String toString() {
    // with ''' allows returning a multiline string
    return '''
  LoginPasswordFormState: 
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    password: $password
''';
  }
}
