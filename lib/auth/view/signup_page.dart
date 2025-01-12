import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/authtype_cubit.dart';
import 'package:maitri_app/utils/app_scaffold.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showLogin = context.select((AuthtypeCubit b) => b.state);
    return AppScaffold(
      releaseFocus: true,
      body: AppConstrainedScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: Container(
            child: Column(
          children: [
            SizedBox(height: AppSpacing.xxxlg + AppSpacing.xlg),
            Center(
              child: AppLogo(
                fit: BoxFit.contain,
                width: 200,
                height: 60,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
