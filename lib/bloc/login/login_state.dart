part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  LoginState(
      {this.email = '',
      this.password = '',
      this.msg = '',
      this.loginStatus = LoginStatus.initial});

  final String email, password, msg;
  final LoginStatus loginStatus;

  LoginState copyWith(
      {String? email,
      String? password,
      String? msg,
      LoginStatus? loginStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      msg: msg ?? this.msg,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, msg, loginStatus];
}
