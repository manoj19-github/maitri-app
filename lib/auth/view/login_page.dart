import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:maitri_app/auth/widgets/email_field.dart';
import 'package:maitri_app/auth/widgets/login_form.dart';
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
            LoginForm()
          ],
        )));
  }
}
