import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/src/data/repository/auth_repository.dart';
import 'package:shop/src/routes/app_pages.dart';
import 'package:shop/src/screens/login_and_register/widgets/btn_submit.dart';
import 'package:shop/src/screens/login_and_register/widgets/input.dart';
import 'package:shop/src/screens/login_and_register/widgets/text_fommated.dart';
import 'package:shop/src/widgets/dialog_notication.dart';
import 'package:shop/src/widgets/dialog_process.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _fullname = '';
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
                label: "Fullname",
                hinttext: "Fullname",
                onChange: (val) {
                  setState(() {
                    _fullname = val.toString().trim();
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
                height: 25,
              ),
              Input(
                label: "Retype Password",
                hinttext: "Retype Password",
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              BtnSubmit(
                "Register",
                onTap: () async {
                  showDialogLoading(context);
                  int isSuccess = await AuthRepository().register(
                    email: _email,
                    password: _password,
                  );
                  Get.back();
                  if (isSuccess == 200) {
                    Get.offAllNamed(Routes.ROOT);
                  } else if (isSuccess == -1) {
                    showDialogNotication(context,
                        title: "REGISTER FAILED",
                        content:
                            "This email already used!!!\nIf you have an account, please login");
                  } else
                    showDialogNotication(context,
                        title: "REGISTER FAILED",
                        content: "Register failed, please check again!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
