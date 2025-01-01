import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  AppLogo(
      {super.key,
      this.width = 100,
      this.height = 100,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    if (context.isDark)
      return Assets.images.applogo1
          .image(width: width, height: height, fit: fit);
    return Assets.images.applogo2.image(width: width, height: height, fit: fit);
  }
}
