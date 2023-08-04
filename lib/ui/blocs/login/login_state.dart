part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String usernameTemp;
  final String passwordTemp;
  final bool validate;
  final bool error;
  final String errorMessage;

  const LoginState({
    required this.usernameTemp,
    required this.passwordTemp,
    required this.validate,
    required this.error,
    required this.errorMessage,
  });

  LoginState copyWith({
    String? usernameTemp,
    String? passwordTemp,
    bool? validate,
    bool? error,
    String? errorMessage,
  }) {
    return LoginState(
      usernameTemp: usernameTemp ?? this.usernameTemp,
      passwordTemp: passwordTemp ?? this.passwordTemp,
      validate: validate ?? this.validate,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        usernameTemp,
        passwordTemp,
        validate,
        errorMessage,
        error,
      ];
}
