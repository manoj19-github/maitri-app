import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/login_cubit.dart';

import 'package:shared/shared.dart';

class AuthProviderSignInButton extends StatelessWidget {
  const AuthProviderSignInButton({
    this.provider = AuthProvider.google,
    required this.onPressed,
    required this.btnText,
    bool this.isCustom = false,
    super.key,
  });
  final bool? isCustom;
  final AuthProvider? provider;
  final String btnText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isGoogleAuthInProgress = context.select(
        (LoginCubit cubit) => cubit.state.status.isGoogleAuthInProgress);
    final isGithubAuthInProgress = context.select(
        (LoginCubit cubit) => cubit.state.status.isGithubAuthInProgress);
    final isInProgress = provider == AuthProvider.google
        ? isGoogleAuthInProgress
        : isGithubAuthInProgress;
    final effectiveIcon = provider == AuthProvider.github
        ? Assets.icons.github.svg()
        : Assets.icons.google.svg();

    final icon = SizedBox.square(
      dimension: 24,
      child: effectiveIcon,
    );
    return Container(
      constraints: BoxConstraints(
        minWidth: context.screenWidth > 600
            ? context.screenWidth * .6
            : context.screenWidth,
        // minWidth: switch (context.screenWidth) {
        //   > 600 => context.screenWidth * .6,
        //   _ => context.screenWidth,
        // },
      ),
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Tappable.faded(
        throttle: true,
        throttleDuration: 650.ms,
        backgroundColor: context.theme.focusColor,
        borderRadius: BorderRadius.circular(4),
        onTap: isInProgress ? null : onPressed,
        child: isInProgress && AuthProvider.google == provider && !isCustom!
            ? Center(child: AppCircularProgress(context.adaptiveColor))
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Offstage(child: Flexible(child: icon), offstage: isCustom!),
                  Offstage(
                      child: SizedBox(width: AppSpacing.md),
                      offstage: isCustom!),
                  Flexible(
                    child: Text(
                      btnText,
                      style: context.labelLarge?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ]),
              ),
      ),
    );
  }
}

enum AuthProvider {
  github('Github'),
  google('Google');

  const AuthProvider(this.value);

  final String value;
}
