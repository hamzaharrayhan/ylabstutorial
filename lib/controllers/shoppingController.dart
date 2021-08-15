import 'package:get/get.dart';
import 'package:ylabstutorial/models/product.dart';

class ShoppingController extends GetxController {
  // ignore: deprecated_member_use
  var products = List<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'first',
          productImage: 'asda',
          productDescription: 'it is the description of the product',
          price: 3000),
      Product(
          id: 2,
          productName: 'second',
          productImage: 'asda',
          productDescription: 'it is the description of the product',
          price: 4000),
      Product(
          id: 1,
          productName: 'third',
          productImage: 'asda',
          productDescription: 'it is the description of the product',
          price: 5000),
    ];
    products.value = productResult;
  }
}
