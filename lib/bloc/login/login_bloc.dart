import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChange>(_onEmailChanged);
    on<PasswordChange>(_onPasswordChange);
    on<LoginApi>(_loginApi);
    on<SignUpApi>(_signUpApi);
  }



  void _onEmailChanged(EmailChange event,Emitter<LoginState> emit){
    emit(
      state.copyWith(
        email: event.email
      )
    );
  }
  void _onPasswordChange(PasswordChange event,Emitter<LoginState> emit){
    emit(
      state.copyWith(
        password: event.password
      )
    );
  }
  Future<void> _loginApi(LoginApi event,Emitter<LoginState> emit) async {
    emit(
        state.copyWith(
          loginStatus: LoginStatus.loading,
        )
    );

    Map data={"email" :state.email ,"password":state.password};


    try{
      final response=await http.post(Uri.parse("https://reqres.in/api/login"),body:data);
      var reponseData=jsonDecode(response.body);
      if(response.statusCode==200){

        emit(
            state.copyWith(
                loginStatus: LoginStatus.success,
                msg: "Login Successful"
            )
        );
      }else{
        emit(
            state.copyWith(
              loginStatus: LoginStatus.error,
                msg: reponseData['error']
            )
        );
      }

    }catch(e){
      emit(
          state.copyWith(
              msg: e.toString()
          )
      );
    }
  }
  Future<void> _signUpApi(SignUpApi event,Emitter<LoginState> emit) async {
    emit(
        state.copyWith(
          loginStatus: LoginStatus.loading,
        )
    );

    Map data={"email" :state.email ,"password":state.password};


    try{
      final response=await http.post(Uri.parse("https://reqres.in/api/register"),body:data);
      var reponseData=jsonDecode(response.body);
      if(response.statusCode==200){

        emit(
            state.copyWith(
                loginStatus: LoginStatus.success,
                msg: "Login Successful"
            )
        );
      }else{
        emit(
            state.copyWith(
              loginStatus: LoginStatus.error,
                msg: reponseData['error']
            )
        );
      }

    }catch(e){
      emit(
          state.copyWith(
              msg: e.toString()
          )
      );
    }
  }
}
