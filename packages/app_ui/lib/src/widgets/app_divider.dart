import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key,this.color,this.height,this.indent,this.endIndent});
  final double? height;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor =     MediaQuery.of(context).platformBrightness == Brightness.dark ? AppColors.emphasizeDarkGrey : AppColors.emphasizeGrey;
    return Divider(
        height: height,
        indent: indent,
        endIndent: endIndent,
        color: color ?? effectiveColor);
  }
}

class AppSilverDivider extends StatelessWidget {
  const AppSilverDivider({super.key,this.height,this.indent,this.endIndent,this.color});
  final double? height;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:AppDivider(height: height,indent: indent,endIndent: endIndent,color:color,)
    );
  }
}