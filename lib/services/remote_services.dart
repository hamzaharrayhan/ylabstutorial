import 'package:http/http.dart' as http;
import 'package:ylabstutorial/models/storemodel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<StoreProduct>> fetchStoreProducts() async {
    var url = Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = storeProductFromJson(response.body);
      return jsonString;
    } else {
      return null;
    }
  }
}
