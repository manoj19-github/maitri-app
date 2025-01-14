import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:maitri_app/auth/cubit/login_cubit.dart';
import 'package:maitri_app/auth/cubit/signup_cubit.dart';
import 'package:shared/shared.dart';

class PasswordRegister extends StatefulWidget {
  const PasswordRegister({super.key});

  @override
  State<PasswordRegister> createState() => _PasswordRegisterState();
}

class _PasswordRegisterState extends State<PasswordRegister> {
  late TextEditingController _passwordRegisterController;
  late FocusNode _passwordFocusNode;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _passwordRegisterController = TextEditingController();
    _passwordFocusNode = FocusNode()..addListener(_focusNodeListener);
    _debouncer = Debouncer(miliseconds: 500);
  }

  void _focusNodeListener() {
    if (_passwordFocusNode.hasFocus) {
      context.read<SignupCubit>().onPasswordUnfocused();
    }
  }

  @override
  void dispose() {
    _passwordRegisterController.dispose();

    _passwordFocusNode = FocusNode()
      ..removeListener(_focusNodeListener)
      ..dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordErrorText = context
        .select((SignupCubit cubit) => cubit.state.password.errorMessage);
    final isShowPassword =
        context.select((SignupCubit cubit) => cubit.state.showPassword);
    return AppTextField(
        filled: true,
        textController: _passwordRegisterController,
        // hintStyle: const TextStyle(color: Colors.deepPurpleAccent),
        focusNode: _passwordFocusNode,
        textInputType: TextInputType.visiblePassword,
        obscureText: !isShowPassword,
        suffixIcon: IconButton(
          color: Colors.deepPurpleAccent,
          icon: Icon(!isShowPassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context
                .read<SignupCubit>()
                .changePasswordVisibility(!isShowPassword);
          },
        ),
        errorText: passwordErrorText,
        textInputAction: TextInputAction.done,
        onChanged: (value) => _debouncer.run(() {
              context.read<SignupCubit>().onPasswordChanged(value);
            }),
        hintText: "Password");
  }
}
