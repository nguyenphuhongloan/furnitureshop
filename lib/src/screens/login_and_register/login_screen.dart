import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/app.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/data/repository/auth_repository.dart';
import 'package:shop/src/routes/app_pages.dart';
import 'package:shop/src/screens/login_and_register/widgets/btn_submit.dart';
import 'package:shop/src/screens/login_and_register/widgets/input.dart';
import 'package:shop/src/screens/login_and_register/register_screen.dart';
import 'package:shop/src/screens/login_and_register/widgets/text_fommated.dart';
import 'package:shop/src/widgets/dialog_notication.dart';
import 'package:shop/src/widgets/dialog_process.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle("Login"),
              SizedBox(
                height: 25,
              ),
              Input(
                label: "Email",
                hinttext: "Email@gmail.com",
                onChange: (val) {
                  setState(() {
                    _email = val.toString().trim();
                  });
                },
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                label: "Password",
                hinttext: "Password",
                obscureText: true,
                onChange: (val) {
                  setState(() {
                    _password = val.toString().trim();
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              BtnSubmit(
                "Login",
                onTap: () async {
                  // Show dialog loading
                  showDialogLoading(context);
                  int isLoginSuccess = await AuthRepository()
                      .login(email: _email, password: _password);
                  Get.back();
                  if (isLoginSuccess == 200) {
                    Get.offAll(App());
                  } else {
                    showDialogNotication(context,
                        title: "LOGIN FAILED",
                        content:
                            "Login failed, please check your email and password then try again");
                    // Show alert: login failure!
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  height: 3,
                  color: Colors.black,
                )),
                Text("  OR  "),
                Expanded(child: Divider(height: 3, color: Colors.black)),
              ]),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 55,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/google.svg",
                          width: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            height: 55,
                            child: Center(
                                child: Text(
                              "Sign in with Google",
                              style: TextStyle(fontSize: 18),
                            )))
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade500, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Not register yet? ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.REGISTER);
                      },
                      child: Text("Create an account",
                          style: TextStyle(
                              fontSize: 17,
                              color: primaryColor,
                              fontWeight: FontWeight.w400))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
