part of 'signup_cubit.dart';



typedef signupErrorMessage = String;

enum SignupSubmissionStatus {
  idle,

  loading,
  initial,
  error,
  success;

  bool get isSuccess => this == SignupSubmissionStatus.success;
  bool get isLoading => this == SignupSubmissionStatus.loading;
  bool get isError => this == SignupSubmissionStatus.error;
}

extension SignupSumissionX on SignupSubmissionStatus {
  bool get isSuccess => this == SignupSubmissionStatus.success;
  bool get isLoading => this == SignupSubmissionStatus.loading;
  bool get isError => this == SignupSubmissionStatus.error;
}

enum SignupStatus { initial, loading, success, error }

class SignupState extends Equatable {
  final SignupSubmissionStatus status;
  // final String message;
  final Email email;
  final Password password;
  final bool showPassword;
  final FullName fullName;
  final signupErrorMessage? errorMessage;

  const SignupState._(
      {required this.status,
      required this.email,
      required this.password,
      required this.showPassword,
      required this.fullName,
      this.errorMessage});
  SignupState.initial()
      : this._(
            showPassword: false,
            status: SignupSubmissionStatus.idle,
            email: Email.pure(),
            fullName: FullName.pure(),
            password: Password.pure());

  SignupState copyWith({
    SignupSubmissionStatus? status,
    Email? email,
    Password? password,
    bool? showPassword,
    String? errorMessage,
    FullName? fullName,
  }) {
    return SignupState._(
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      fullName: fullName ?? this.fullName,
    );
  }

  
  @override
  List<Object> get props => [status, email, password, showPassword, fullName];
}
