import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/authtype_cubit.dart';
import 'package:maitri_app/auth/widgets/signup_button.dart';
import 'package:maitri_app/auth/widgets/signup_form.dart';
import 'package:maitri_app/utils/app_scaffold.dart';
import "package:maitri_blocks_ui/maitri_blocks_ui.dart";

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showLogin = context.select((AuthtypeCubit b) => b.state);
    return AppScaffold(
      releaseFocus: true,
      body: AppConstrainedScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
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
            SizedBox(height: AppSpacing.xlg),
            AvatarImagePicker(
              radius: 50,
            ),
            SizedBox(height: AppSpacing.lg),
            SignupForm(),
            Container(
                margin: EdgeInsets.only(
                    top: AppSpacing.xxxlg,
                    left: AppSpacing.lg,
                    right: AppSpacing.lg),
                child: SignupButton()),
            Container(
              margin: EdgeInsets.only(top: 10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("You have already login?", style: TextStyle(fontSize: 12)),
                Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: InkWell(
                    onTap: () => context
                        .read<AuthtypeCubit>()
                        .changeAuth(showLogin: showLogin),
                    child: Text(
                      " Sign in here.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            
          ],
        )),
      ),
    );
  }
}
