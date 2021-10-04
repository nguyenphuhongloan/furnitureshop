import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/screens/login_and_register/widgets/btn_submit.dart';
import 'package:shop/screens/login_and_register/widgets/input.dart';
import 'package:shop/screens/login_and_register/register_screen.dart';
import 'package:shop/screens/login_and_register/widgets/text_fommated.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                label: "Password",
                hinttext: "Password",
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              BtnSubmit("Login"),
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
                              "Sigin with Google",
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
                      onTap: () => Get.to(RegisterScreen()),
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

