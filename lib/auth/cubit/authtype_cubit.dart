import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authtype_state.dart';

class AuthtypeCubit extends Cubit<bool> {
  AuthtypeCubit() : super(true);

  void changeAuth({required bool showLogin}) => emit(!showLogin);
}
