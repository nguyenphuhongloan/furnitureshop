import 'package:flutter/material.dart';
import 'package:shop/screens/login_and_register/widgets/btn_submit.dart';
import 'package:shop/screens/login_and_register/widgets/input.dart';
import 'package:shop/screens/login_and_register/widgets/text_fommated.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle("Register"),
              SizedBox(height: 25,),
              Input(
                label: "Email",
                hinttext: "Email@gmail.com",),
              SizedBox(
                height: 25,
              ),
              Input(
                label: "Password",
                hinttext: "Password", 
                obscureText: true,),
               SizedBox(
                height: 25,
              ),
              Input(
                label: "Retype Password",
                hinttext: "Retype Password",
                obscureText: true,),
              SizedBox(
                height: 40,
              ),
              BtnSubmit("Register"),
            ],
          ),
        ),
      ),
    );
  }
}
