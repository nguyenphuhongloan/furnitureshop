import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/src/data/fake.dart';
import 'package:shop/src/data/repository/auth_repository.dart';
import 'package:shop/src/models/category.dart';
import 'package:shop/src/screens/category/category_screen.dart';
import 'package:shop/src/screens/home/widgets/category_card.dart';
import 'package:shop/src/screens/home/widgets/header.dart';
import 'package:shop/src/screens/home/widgets/image_card.dart';
import 'package:shop/src/screens/home/widgets/promotion_card.dart';
import 'package:shop/src/screens/home/widgets/section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    AuthRepository().getMyProfile();
    setState(() {
      
    }); 
    // Call api get my profile

    // After call, map response to user provider
    super.initState();
    
  }
   
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Header(),
              Section(
                  'Categories',
                  Fake.categories
                      .map((e) => CategoryCard(
                          title: e.title,
                          iconPath: e.iconPath,
                          onTap: () {
                            onCategorySelected(e);
                          }))
                      .toList()),
              Section(
                  "Today's Promo",
                  Fake.promotions
                      .map((e) => PromotionCard(
                            backgroundImagePath: e.backgroundImagePath,
                            caption: e.caption,
                            imagePath: e.imagePath,
                            reverseGradient: e.reverseGradient,
                            subtitle: e.subtitle,
                            tag: e.tag,
                            title: e.title,
                          ))
                      .toList()),
              Section("Trending Furniture",
                  Fake.trending.map((e) => ImageCard(e)).toList()),
              Section("Featured Furniture",
                  Fake.featured.map((e) => ImageCard(e)).toList()),
            ],
          ),
        ),
      ),
    );
  }

  void onCategorySelected(Category e) {
    Get.to(CategoryScreen());
    
  }
}
