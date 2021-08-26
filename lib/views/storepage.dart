import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ylabstutorial/controllers/storecontroller.dart';
import 'package:ylabstutorial/views/news.dart';
import 'package:ylabstutorial/views/shoppingPage.dart';
import 'package:ylabstutorial/views/storeproduct_tile.dart';

class StorePage extends StatelessWidget {
  final StoreController storeController = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () => Get.to(ShoppingPage()),
            ),
            actions: [
              IconButton(
                onPressed: () => Get.to(NewsView()),
                icon: Icon(Icons.book),
                color: Colors.black,
              )
            ],
          ),
          body: Column(children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Hamza\'s Shop',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w900))),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
                ],
              ),
            ),
            Expanded(child: Obx(() {
              if (storeController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: storeController.productList.length,
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.h,
                    itemBuilder: (context, index) {
                      return StoreProductTile(
                          storeController.productList[index]);
                    },
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.fit(1);
                    });
              }
            })),
          ])),
    );
  }
}
