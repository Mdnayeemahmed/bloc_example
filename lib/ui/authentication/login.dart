import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;


  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                  current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                              EmailChange(email: value));
                        },
                        onFieldSubmitted: (value) {},

                        decoration: InputDecoration(
                            hintText: 'email', border: OutlineInputBorder()
                        )
                    );
                  }),

              SizedBox(
                height: 20,
              ),

              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                  current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                        focusNode: passwordFocusNode,
                        onChanged: (value) {
                          context.read<LoginBloc>().add(
                              PasswordChange(password: value));
                        },
                        onFieldSubmitted: (value) {},

                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'password', border: OutlineInputBorder()
                        )
                    );
                  }),

              SizedBox(
                height: 50,
              ),

              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if(state.loginStatus==LoginStatus.error){
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(state.msg.toString())));
                  }
                  if(state.loginStatus==LoginStatus.loading){
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(content: Text("submitting")));
                  }


                  // TODO: implement listener
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) =>
                    current.password != previous.password,
                    builder: (context, state) {
                      return ElevatedButton(onPressed: () {
                        context.read<LoginBloc>().add(LoginApi());
                      }, child: Text("Login"));
                    }),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
