import 'package:flutter/material.dart';
import 'package:shop/src/data/fake.dart';
import 'package:shop/src/screens/category/widgets/furniture_gird_item.dart';
import 'package:shop/src/screens/category/widgets/header_sliver.dart';
import 'package:shop/src/widgets/bottom_navigation_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotNavBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HeaderSliver(
                minExtent: 120,
                maxExtent: 120,
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: Fake.furniture.asMap().entries.map((f) {
                return FurnitureGridItem(
                    item: f.value,
                    margin: EdgeInsets.only(
                      left: f.key.isEven ? 16 : 0,
                      right: f.key.isOdd ? 16 : 0,
                    ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
