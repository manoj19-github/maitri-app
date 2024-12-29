import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class Googlesignbtn extends StatelessWidget {
  final void Function() onPressed;
  const Googlesignbtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Tappable(
        onTap: onPressed,
        backgroundColor: context.theme.focusColor,
        fadeStrength: FadeStrength.lg,
        borderRadius: BorderRadius.all(Radius.circular(20)),

        // icon: Assets.icons.google.svg(height: 24, width: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs + AppSpacing.xxs),
          child: Text(
            "Google Sign In",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
    );
  }
}
