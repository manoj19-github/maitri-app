import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/cubit/login_cubit.dart';
import 'package:maitri_app/auth/widgets/app_divider.dart';
import 'package:maitri_app/auth/widgets/auth_provider_sign_in_button.dart';
import 'package:maitri_app/auth/widgets/email_field.dart';
import 'package:maitri_app/auth/widgets/forgot_password_button.dart';
import 'package:maitri_app/auth/widgets/login_form.dart';
import 'package:maitri_app/auth/widgets/sign_in_button.dart';
import 'package:maitri_app/utils/app_scaffold.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        releaseFocus: true,
        body: Container(
            child: Column(
          children: [
            const SizedBox(
              height: AppSpacing.xxxlg * 1.5,
            ),
            Center(
              child: AppLogo(
                fit: BoxFit.contain,
                width: 200,
                height: 60,
              ),
            ),
            LoginForm(),

            Container(
                margin:
                    EdgeInsets.only(right: AppSpacing.lg, top: AppSpacing.xs),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ForgotPasswordButton())),
            // const SizedBox(
            //   height: AppSpacing.md,
            // ),
            Container(
                margin: EdgeInsets.only(
                    top: AppSpacing.xxxlg,
                    left: AppSpacing.lg,
                    right: AppSpacing.lg),
                child: SigninButton()),

            Container(
              margin: EdgeInsets.only(
                top: AppSpacing.xxlg,
                left: AppSpacing.lg,
                right: AppSpacing.lg,
              ),
              child: TextAppDivider(
                withText: true,
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: AppSpacing.xxlg,
                    left: AppSpacing.lg,
                    right: AppSpacing.lg),
                child: AuthProviderSignInButton(
                  provider: AuthProvider.google,
                  onPressed: () {
                    context.read<LoginCubit>().loginWithGoogle();
                  },
                  btnText: 'Sign in with Google',
                )),
            Container(
                margin: EdgeInsets.only(
                    top: AppSpacing.sm,
                    left: AppSpacing.lg,
                    right: AppSpacing.lg),
                child: AuthProviderSignInButton(
                  isCustom: true,
                  onPressed: () {
                    context.read<LoginCubit>().loginWithGoogle();
                  },
                  btnText: 'Sign in  with Test Account',
                ))
           
          

       

          ],
        )));
  }
}
