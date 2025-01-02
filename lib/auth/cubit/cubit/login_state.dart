part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  // final String message;
  final Email email;
  final Password password;
  final bool showPassword;

  const LoginState._(
      {required this.status,
      required this.email,
      required this.password,
      required this.showPassword});
  LoginState.initial()
      : this._(
            showPassword: false,
            status: LoginStatus.initial,
            email: Email.pure(),
            password: Password.pure());

  @override
  List<Object> get props => [status, email, password];

  LoginState copyWith({
    LoginStatus? status,
    Email? email,
    Password? password,
    bool? showPassword,
  }) {
    return LoginState._(
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
