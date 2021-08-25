import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ylabstutorial/controllers/cartController.dart';
import 'package:ylabstutorial/views/storepage.dart';

import '../main.dart';

class Tes extends StatelessWidget {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Get.to(Home()),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(StorePage()),
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: Obx(() {
        return Center(
          child: Text('hasilnya ${cartController.count}'),
        );
      }),
    );
  }
}
