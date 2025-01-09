import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TextAppDivider extends StatelessWidget {
  TextAppDivider({super.key, this.padding, this.withText = false});
  final double? padding;
  final bool? withText;

  @override
  Widget build(BuildContext context) {
    final dividerColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? AppColors.emphasizeDarkGrey
            : AppColors.brightGrey;
    if (withText == null || withText == false) {
      return Container(
        margin:
            padding != null ? EdgeInsets.symmetric(horizontal: padding!) : null,
        height: 1,
        color: dividerColor,
      );
    } else {
      return Container(
          margin: padding != null
              ? EdgeInsets.symmetric(horizontal: padding!)
              : null,
          // color: dividerColor,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: dividerColor,
                height: 1,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'OR',
                  style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? AppColors.white
                          : AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                  child: Container(
                color: dividerColor,
                height: 1,
              )),
            ],
          ));
    }
  }
}
