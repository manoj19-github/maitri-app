import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/cubit/login_cubit.dart';
import 'package:shared/shared.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<PasswordField> {
  late TextEditingController _passwordField;
  late FocusNode _passwordFocusNode;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _passwordField = TextEditingController();
    _passwordFocusNode = FocusNode()..addListener(_focusNodeListener);
    _debouncer = Debouncer(miliseconds: 500);
  }

  void _focusNodeListener() {
    if (_passwordFocusNode.hasFocus) {
      context.read<LoginCubit>().onPasswordUnfocused();
    }
  }

  @override
  void dispose() {
    _passwordField.dispose();

    _passwordFocusNode = FocusNode()
      ..removeListener(_focusNodeListener)
      ..dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordErrorText =
        context.select((LoginCubit cubit) => cubit.state.password.errorMessage);
    final isShowPassword =
        context.select((LoginCubit cubit) => cubit.state.showPassword);
    print("isShowPassword >>>> ${isShowPassword}");
    return AppTextField(
        filled: true,
        textController: _passwordField,
        // hintStyle: const TextStyle(color: Colors.deepPurpleAccent),
        focusNode: _passwordFocusNode,
        textInputType: TextInputType.visiblePassword,
        obscureText: !isShowPassword,
        suffixIcon: IconButton(
          color: Colors.deepPurpleAccent,
          icon: Icon(!isShowPassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context
                .read<LoginCubit>()
                .changePasswordVisibility(!isShowPassword);
          },
        ),
        errorText: passwordErrorText,
        textInputAction: TextInputAction.done,
        onChanged: (value) => _debouncer.run(() {
              context.read<LoginCubit>().onPasswordChanged(value);
            }),
        hintText: "Password");
  }
}
