import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  final File? avatarFile;
  SignupButton({super.key, required this.avatarFile});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
        (SignupCubit cubit) => cubit.state.status == SignupStatus.loading);
    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: context.screenWidth > 600
                ? context.screenWidth * 0.6
                : context.screenWidth),
        child: isLoading
            ? AppButton.inProgress()
            : AppButton.auth(
                style: ButtonStyle(
                  enableFeedback: true,
                  textStyle: WidgetStatePropertyAll<TextStyle>(
                      context.textTheme.bodyLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(Colors.deepPurpleAccent),
                ),
                "Sign up",
                () => context.read<SignupCubit>().onSubmit(avatarFile)));
  }
}
