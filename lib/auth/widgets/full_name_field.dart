import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maitri_app/auth/cubit/signup_cubit.dart';
import 'package:shared/shared.dart';

class FullNameField extends StatefulWidget {
  const FullNameField({super.key});

  @override
  State<FullNameField> createState() => _FullNameState();
}

class _FullNameState extends State<FullNameField> {
  late TextEditingController _fullNameController;
  late FocusNode _fullNameFocusNode;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _fullNameFocusNode = FocusNode()..addListener(_focusNodeListener);
    _debouncer = Debouncer(miliseconds: 500);
  }

  void _focusNodeListener() {
    if (_fullNameFocusNode.hasFocus) {
      //context.read<SignupCubit>().onEmailUnfocused();
      context.read<SignupCubit>().onFullNameUnfocused();
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();

    _fullNameFocusNode = FocusNode()
      ..removeListener(_focusNodeListener)
      ..dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignupCubit cubit) => cubit.state.status.isLoading);
    final fullNameErrorText = context
        .select((SignupCubit cubit) => cubit.state.fullName.errorMessage);
    return AppTextField(
      filled: true,
      textController: _fullNameController,
      focusNode: _fullNameFocusNode,
      enabled: !isLoading,

      // hintStyle: const TextStyle(color: Colors.deepPurpleAccent),
      textInputType: TextInputType.name,
      errorText: fullNameErrorText,
      autofillHints: [AutofillHints.name],
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => _debouncer.run(() {
        context.read<SignupCubit>().onFullNameChanged(value);
      }),
      hintText: "Full Name",
    );
  }
}
