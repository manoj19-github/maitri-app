import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/signup_cubit.dart';
import 'package:shared/shared.dart';

class EmailRegisterField extends StatefulWidget {
  const EmailRegisterField({super.key});

  @override
  State<EmailRegisterField> createState() => _EmailRegisterFieldState();
}

class _EmailRegisterFieldState extends State<EmailRegisterField> {
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
      context.read<SignupCubit>().onEmailUnfocused();
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
    final isLoading =
        context.select((SignupCubit cubit) => cubit.state.status.isLoading);
    final emailErrorText =
        context.select((SignupCubit cubit) => cubit.state.email.errorMessage);
    return AppTextField(
        filled: true,
        textController: _emailController,
        focusNode: _emailFocusNode,
        enabled: !isLoading,
        // hintStyle: const TextStyle(color: Colors.deepPurpleAccent),
        textInputType: TextInputType.emailAddress,
        errorText: emailErrorText,
        autofillHints: [AutofillHints.email],
        textInputAction: TextInputAction.next,
        onChanged: (value) => _debouncer.run(() {
              context.read<SignupCubit>().onEmailChanged(value);
            }),
        hintText: "Email");
  }
}
