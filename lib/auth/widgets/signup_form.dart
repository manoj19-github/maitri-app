import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/authtype_cubit.dart';
import 'package:maitri_app/auth/widgets/email_register_field.dart';
import 'package:maitri_app/auth/widgets/full_name_field.dart';
import 'package:maitri_app/auth/widgets/password_register_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final showLogin = context.select((AuthtypeCubit b) => b.state);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FullNameField(),
        SizedBox(height: AppSpacing.md),
        EmailRegisterField(),
        SizedBox(height: AppSpacing.md),
        PasswordRegister(),
      ],
    );
  }
}
