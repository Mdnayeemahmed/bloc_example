import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {

  final emailFocusNode=FocusNode();
  final passwordFocusNode=FocusNode();






  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){},
                onFieldSubmitted: (value){},

                decoration:InputDecoration(
                    hintText: 'email',border: OutlineInputBorder()
                )
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                focusNode: passwordFocusNode,
                onChanged: (value){},
                onFieldSubmitted: (value){},

                keyboardType: TextInputType.text,
                decoration:InputDecoration(
                    hintText: 'password',border: OutlineInputBorder()
                )
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){}, child: Text("Login"))

          ],
        ),
      ),
    );
  }
}
