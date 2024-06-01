part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.submitStatus = FormStatus.initial,
    this.password = '',
    this.email = '',
    this.errorSubmit = '',
  });

  final FormStatus submitStatus;
  final String password;
  final String email;
  final String errorSubmit;

  bool get isValid => password.isNotEmpty && email.isNotEmpty;

  LoginState copyWith({
    FormStatus? submitStatus,
    String? password,
    String? email,
    String? errorSubmit,
  }) {
    return LoginState(
      submitStatus: submitStatus ?? this.submitStatus,
      password: password ?? this.password,
      email: email ?? this.email,
      errorSubmit: errorSubmit ?? this.errorSubmit,
    );
  }

  @override
  List<Object?> get props => [
        submitStatus,
        email,
        password,
        errorSubmit,
      ];
}
