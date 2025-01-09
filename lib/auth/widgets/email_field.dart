import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/cubit/login_cubit.dart';
import 'package:shared/shared.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late TextEditingController _emailController;
  late FocusNode _emailFocusNode;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _emailFocusNode = FocusNode()..addListener(_focusNodeListener);
    _debouncer = Debouncer(miliseconds: 500);
  }

  void _focusNodeListener() {
    if (_emailFocusNode.hasFocus) {
      context.read<LoginCubit>().onEmailUnfocused();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();

    _emailFocusNode = FocusNode()
      ..removeListener(_focusNodeListener)
      ..dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailErrorText =
        context.select((LoginCubit cubit) => cubit.state.email.errorMessage);
    return AppTextField(
        filled: true,
        textController: _emailController,
        focusNode: _emailFocusNode,
        // hintStyle: const TextStyle(color: Colors.deepPurpleAccent),
        textInputType: TextInputType.emailAddress,
        errorText: emailErrorText,
        textInputAction: TextInputAction.next,
        onChanged: (value) => _debouncer.run(() {
              context.read<LoginCubit>().onEmailChanged(value);
            }),
        hintText: "Email");
  }
}
