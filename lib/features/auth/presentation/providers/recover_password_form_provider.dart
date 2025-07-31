import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:banking_flutter_app/features/shared/shared.dart';

// * 3 - StateNotifierProvider - consumed externally - (How are we going to consume this provider?)
final recoverPasswordFormProvider = StateNotifierProvider.autoDispose<
  RecoverPasswordFormNotifier,
  RecoverPasswordFormState
>((ref) {
  return RecoverPasswordFormNotifier();
});

// * 2 - How we implement a notifier
class RecoverPasswordFormNotifier
    extends StateNotifier<RecoverPasswordFormState> {
  RecoverPasswordFormNotifier() : super(RecoverPasswordFormState());

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
class RecoverPasswordFormState {
  final bool isPosting; // for when the transaction is made and is asynchronous
  final bool isFormPosted; // when the user clicks the submit button
  final bool isValid;
  final Email email;

  RecoverPasswordFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
  });

  RecoverPasswordFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
  }) => RecoverPasswordFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    email: email ?? this.email,
  );

  @override
  String toString() {
    // with ''' allows returning a multiline string
    return '''
  RecoverPasswordFormState: 
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    email: $email
''';
  }
}
