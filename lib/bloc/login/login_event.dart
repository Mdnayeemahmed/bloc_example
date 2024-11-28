part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  List<Object?> get props => [];

}

class EmailChange extends LoginEvent {
  final String email;

  EmailChange({required this.email});


  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
class PasswordChange extends LoginEvent {
  final String password;

  PasswordChange({required this.password});


  @override
  // TODO: implement props
  List<Object?> get props => [password];
}
class LoginApi extends LoginEvent{}
class SignUpApi extends LoginEvent{}
