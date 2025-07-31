import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';

// * 3 - StateNotifierProvider - consumed externally - (How are we going to consume this provider?)
final loginEmailFormProvider = StateNotifierProvider.autoDispose<
  LoginEmailFormNotifier,
  LoginEmailFormState
>((ref) {
  return LoginEmailFormNotifier();
});

// * 2 - How we implement a notifier
class LoginEmailFormNotifier extends StateNotifier<LoginEmailFormState> {
  LoginEmailFormNotifier() : super(LoginEmailFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail]),
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
    final email = Email.dirty(state.email.value);

    state = state.copyWith(
      isFormPosted: true,
      email: email,
      isValid: Formz.validate([email]),
    );
  }
}

// * 1 - create provider state (StateNotifierProvider)
class LoginEmailFormState {
  final bool isPosting; // for when the transaction is made and is asynchronous
  final bool isFormPosted; // when the user clicks the submit button
  final bool isValid;
  final Email email;

  LoginEmailFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
  });

  LoginEmailFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
  }) => LoginEmailFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    email: email ?? this.email,
  );

  @override
  String toString() {
    // with ''' allows returning a multiline string
    return '''
  LoginEmailFormState: 
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    email: $email
''';
  }
}
