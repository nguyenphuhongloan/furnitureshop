import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/data/local/user_local.dart';
import 'package:shop/src/routes/app_pages.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: AllInput(size: size),
      ),
    );
  }
}

class AllInput extends StatelessWidget {
  const AllInput({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: size.width,
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    UserLocal().clearMyToken();
                    Get.offAllNamed(Routes.ROOT);
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.6435-9/146619328_1418476391660667_5908137929241688446_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=19026a&_nc_ohc=BGP_lHCW52AAX-GrHZx&_nc_ht=scontent.fsgn5-7.fna&oh=7141167900bb77a3a4ae80b424f7e525&oe=6189C732"),
                    radius: 35,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Center(
                  child: Text(
                    "Meo meo meo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.EDITPROFILE);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
