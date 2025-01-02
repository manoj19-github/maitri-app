import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/cubit/login_cubit.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
        (LoginCubit cubit) => cubit.state.status == LoginStatus.loading);
    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: context.screenWidth > 600
                ? context.screenWidth * 0.6
                : context.screenWidth),
        child: isLoading
            ? AppButton.inProgress()
            : AppButton.auth(
                "Sign in", () => context.read<LoginCubit>().onSubmit()));
  }
}
