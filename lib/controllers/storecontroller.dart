import 'package:get/state_manager.dart';
import 'package:ylabstutorial/models/storemodel.dart';
import 'package:ylabstutorial/services/remote_services.dart';

class StoreController extends GetxController {
  // ignore: deprecated_member_use
  var productList = List<StoreProduct>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchStoreProduct();
    super.onInit();
  }

  void fetchStoreProduct() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchStoreProducts();
      products != null
          ? productList.value = products
          : productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}
