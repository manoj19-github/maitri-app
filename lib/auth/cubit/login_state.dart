part of 'login_cubit.dart';



typedef LoginErrorMessage = String;

enum LogInSubmissionStatus {
  idle,

  loading,
  initial,
  error,

  googleAuthInProgress,

  githubAuthInProgress,

  success,

  invalidCredentials,

  userNotFound,

  networkError,

  googleLogInFailure;

  bool get isSuccess => this == LogInSubmissionStatus.success;
  bool get isLoading => this == LogInSubmissionStatus.loading;
  bool get isGoogleAuthInProgress =>
      this == LogInSubmissionStatus.googleAuthInProgress;
  bool get isGithubAuthInProgress =>
      this == LogInSubmissionStatus.githubAuthInProgress;
  bool get isInvalidCredentials =>
      this == LogInSubmissionStatus.invalidCredentials;
  bool get isNetworkError => this == LogInSubmissionStatus.networkError;
  bool get isUserNotFound => this == LogInSubmissionStatus.userNotFound;
  bool get isError =>
      this == LogInSubmissionStatus.error ||
      isUserNotFound ||
      isNetworkError ||
      isInvalidCredentials;
}
extension LogInSubmissionStatusX on LogInSubmissionStatus {
  bool get isSuccess => this == LogInSubmissionStatus.success;
  bool get isLoading => this == LogInSubmissionStatus.loading;
  bool get isGoogleAuthInProgress =>
      this == LogInSubmissionStatus.googleAuthInProgress;
  bool get isGithubAuthInProgress =>
      this == LogInSubmissionStatus.githubAuthInProgress;
  bool get isInvalidCredentials =>
      this == LogInSubmissionStatus.invalidCredentials;
  bool get isNetworkError => this == LogInSubmissionStatus.networkError;
  bool get isUserNotFound => this == LogInSubmissionStatus.userNotFound;
  bool get isError =>
      this == LogInSubmissionStatus.error ||
      isUserNotFound ||
      isNetworkError ||
      isInvalidCredentials;
}


enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LogInSubmissionStatus status;
  // final String message;
  final Email email;
  final Password password;
  final bool showPassword;
  final LoginErrorMessage? errorMessage;

  const LoginState._(
      {required this.status,
      required this.email,
      required this.password,
      required this.showPassword,
      this.errorMessage});
  LoginState.initial()
      : this._(
            showPassword: false,
            status: LogInSubmissionStatus.idle,
            email: Email.pure(),
            password: Password.pure());


  LoginState copyWith({
    LogInSubmissionStatus? status,
    Email? email,
    Password? password,
    bool? showPassword,
    String? errorMessage,
    
  }) {
    return LoginState._(
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  
  @override
  List<Object> get props => [status, email, password, showPassword];
}
