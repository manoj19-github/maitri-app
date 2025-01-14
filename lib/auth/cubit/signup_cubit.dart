// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:form_fields/form_fields.dart';

//

// class SignupCubit extends Cubit<SignupState> {
//   SignupCubit() : super(SignupState.initial());
// }

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';
import 'package:powersync_repository/powersync_repository.dart';
import 'package:shared/shared.dart';
import 'package:user_repository/user_repository.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:user_repository/user_repository.dart';
import "package:authenctication_client/authenctication_client.dart";

part 'signup_state.dart';



class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(SignupState.initial());

  final UserRepository _userRepository;

  void changePasswordVisibility(bool _showPassword) {
    emit(
      state.copyWith(showPassword: _showPassword),
    );
  }

  void resetState() => emit(SignupState.initial());

  // Email value was changed, triggering new changes in state.
  void onEmailChanged(String newValue) {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final shouldValidate = previousEmailState.invalid;
    final newEmailState = shouldValidate
        ? Email.dirty(
            newValue,
          )
        : Email.pure(
            newValue,
          );

    final newScreenState = state.copyWith(
      email: newEmailState,
    );

    emit(newScreenState);
  }

  // FullName value was changed, triggering new changes in state.
  void onFullNameChanged(String newValue) {
    final previousScreenState = state;
    final previousFullNameState = previousScreenState.fullName;
    final shouldValidate = previousFullNameState.invalid;
    final newFullNameState = shouldValidate
        ? FullName.dirty(
            newValue,
          )
        : FullName.pure(
            newValue,
          );

    final newScreenState = state.copyWith(fullName: newFullNameState);

    emit(newScreenState);
  }

  void onEmailUnfocused() {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final previousEmailValue = previousEmailState.value;

    final newEmailState = Email.dirty(
      previousEmailValue,
    );
    final newScreenState = previousScreenState.copyWith(
      email: newEmailState,
    );
    emit(newScreenState);
  }

  void onFullNameUnfocused() {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.fullName;
    final previousEmailValue = previousEmailState.value;

    final newFullNameState = FullName.dirty(
      previousEmailValue,
    );
    final newScreenState = previousScreenState.copyWith(
      fullName: newFullNameState,
    );
    emit(newScreenState);
  }

  void onPasswordChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final shouldValidate = previousPasswordState.invalid;
    final newPasswordState = shouldValidate
        ? Password.dirty(
            newValue,
          )
        : Password.pure(
            newValue,
          );

    final newScreenState = state.copyWith(
      password: newPasswordState,
    );

    emit(newScreenState);
  }

  void onPasswordUnfocused() {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final previousPasswordValue = previousPasswordState.value;

    final newPasswordState = Password.dirty(
      previousPasswordValue,
    );
    final newScreenState = previousScreenState.copyWith(
      password: newPasswordState,
    );
    emit(newScreenState);
  }

  void idle() {
    var initialState = SignupState.initial();
    emit(initialState);
  }

  Future<void> onSubmit(File? avatarURL) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final fullName = FullName.dirty(state.fullName.value);
    final isFormValid = FormzValid([email, password, fullName]).isFormValid;

    final newState = state.copyWith(
      email: email,
      password: password,
      fullName: fullName,
      status: isFormValid ? SignupSubmissionStatus.loading : null,
    );

    emit(newState);

    if (!isFormValid) return;

    try {
      await _userRepository.signUpWithPassword(
        email: state.email.value,
        password: state.password.value,
        fullName: state.fullName.value,
      );
      if (isClosed) return;
      final newState = state.copyWith(status: SignupSubmissionStatus.success);
      emit(newState);
    } catch (e, stackTrace) {
      _errorFormatter(e, stackTrace);
    }
  }

  void _errorFormatter(Object e, StackTrace stackTrace) {
    addError(e, stackTrace);

    // final status = switch (e) {
    //   case e
    //   LogInWithPasswordFailure(:final AuthException error) => switch (
    //         error.statusCode?.parse) {
    //       HttpStatus.badRequest => LogInSubmissionStatus.invalidCredentials,
    //       _ => LogInSubmissionStatus.error,
    //     },
    //   LogInWithGoogleFailure => LogInSubmissionStatus.googleLogInFailure,
    //   _ => LogInSubmissionStatus.idle,
    // };

    final newState = state.copyWith(
      status: SignupSubmissionStatus.error,
    );
    emit(newState);
  }
}
