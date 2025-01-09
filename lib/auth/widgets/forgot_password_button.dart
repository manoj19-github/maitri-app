import 'package:flutter/material.dart';
import "package:app_ui/app_ui.dart";
import "package:shared/shared.dart";

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Tappable(
        throttle: true,
        throttleDuration: 650.ms,
        enableFeedback: true,
        fadeStrength: FadeStrength.lg,
        onTap: () {
          // Navigator.pushAndRemoveUntil(
          //     context, ManageForgotPasswordPage.route(), (_) => true);
        },
        child: Text(
          "Forgot Password?",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.titleSmall?.copyWith(color: Colors.deepPurpleAccent),
        ));
  }
}
