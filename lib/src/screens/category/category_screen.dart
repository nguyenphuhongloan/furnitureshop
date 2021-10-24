import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/controller/product_controller.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/screens/category/widgets/furniture_gird_item.dart';
import 'package:shop/src/screens/category/widgets/header_sliver.dart';
import 'package:shop/src/widgets/dialog_process.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _productController = Get.put(ProductController());
  bool _isLoading = true;

  @override
  void initState() {
    //_cartController.initialController();
    super.initState();
    _productController.initialController();
  }

  @override
  Widget build(BuildContext context) {
    //if (_isLoading == true) showDialogLoading(context);

     return Scaffold(
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
            StreamBuilder(
                stream: _productController.getStreamProduct,
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    return SliverGrid.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: snapshot.data!
                            .map((e) => FurnitureGridItem(product: e))
                            .toList());
                  }
                  return SliverGrid.count(crossAxisCount: 2, children: []);
                  /* */
                })
          ],
        ),
      ),
    ); 
  }
}
