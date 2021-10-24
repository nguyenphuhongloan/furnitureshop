import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/screens/login_and_register/widgets/btn_submit.dart';
import 'package:shop/src/screens/login_and_register/widgets/input.dart';
import 'package:shop/src/screens/login_and_register/widgets/text_fommated.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
              Row(
                children: [
                  TextTitle("EDIT PROFILE"),
                  SizedBox(
                  width: 15,),
                   SvgPicture.asset("assets/icons/edit-svgrepo-com.svg",
                   color: primaryColor,
                   height: 25,
                   width: 25,),
                    
                ],
              ),
             
              SizedBox(
                height: 40,
              ),
              Input(
                hinttext: "Fullname",
                label: "Fullname",
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                hinttext: "Email",
                label: "Email",
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                hinttext: "Phone",
                label: "Phone",
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                hinttext: "Address",
                label: "Address",
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                hinttext: "Password",
                label: "Password",
              ),
              SizedBox(
                height: 25,
              ),
              Input(
                hinttext: "Retype Password",
                label: "Retype Password",
              ),
              SizedBox(height: 40,),
              BtnSubmit("EDIT")
            ],
          ),
        ),
      ),
    );
  }
}
