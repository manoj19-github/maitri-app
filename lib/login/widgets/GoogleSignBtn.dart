import 'package:flutter/material.dart';

class Googlesignbtn extends StatelessWidget {
  final void Function() onPressed;
  const Googlesignbtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.auto_awesome),
      label: Text(
        "Google Sign In",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
