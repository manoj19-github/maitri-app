import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:maitri_app/auth/widgets/email_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: AppSpacing.xlg), EmailField()]),
    );
  }
}
