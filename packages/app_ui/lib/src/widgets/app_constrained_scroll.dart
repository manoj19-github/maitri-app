import 'package:flutter/material.dart';

class AppConstrainedScrollView extends StatelessWidget {
  const AppConstrainedScrollView({
    required this.child,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.withScrollBar = false,
    this.controller,
    super.key,
  });

  /// The widget inside a scroll view.
  final Widget child;

  /// The padding to apply to the scroll view.
  final EdgeInsetsGeometry? padding;

  /// The [MainAxisAlignment] to apply to the [Column] inside a scroll view.
  final MainAxisAlignment mainAxisAlignment;

  /// Whether to wrap a scroll view with a [Scrollbar].
  final bool withScrollBar;

  /// Optional [ScrollController] to use for the scroll view.
  final ScrollController? controller;

  Widget _scrollView(BoxConstraints constraints) => SingleChildScrollView(
        controller: controller,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: padding == null
                ? child
                : Padding(padding: padding!, child: child),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (withScrollBar) {
          true => Scrollbar(child: _scrollView(constraints)),
          false => _scrollView(constraints),
        };
      },
    );
  }
}
