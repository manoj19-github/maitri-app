import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:form_fields/src/form_validation_mixin.dart';
import 'package:formz/formz.dart' show FormzInput;

@immutable
class Password extends FormzInput<String, PasswordValidationError>
    with EquatableMixin, FormzValidationMixin {
  const Password.pure([super.value = '']) : super.pure();

  const Password.dirty([
    super.value = '',
  ]) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 6 || value.length > 120) {
      return PasswordValidationError.invalid;
    } else {
      return null;
    }
  }

  @override
  Map<PasswordValidationError?, String?> get validationErrorMessage => {
        PasswordValidationError.empty: 'This field is required',
        PasswordValidationError.invalid:
            'Password should contain at least 6 characters',
        null: null,
      };

  @override
  List<Object?> get props => [value, pure];
}

enum PasswordValidationError {
  empty,

  invalid,
}
