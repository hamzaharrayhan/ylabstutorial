import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ylabstutorial/controllers/cartController.dart';
import 'package:ylabstutorial/controllers/shoppingController.dart';
import 'package:ylabstutorial/main.dart';
import 'package:ylabstutorial/views/storepage.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
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
        body: SafeArea(
            child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(
              height: 50,
            )
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          label: GetX<CartController>(
            builder: (controller) {
              return Text(
                controller.count.toString(),
                style: TextStyle(color: Colors.black),
              );
            },
          ),
          icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.black),
        ));
  }
}
