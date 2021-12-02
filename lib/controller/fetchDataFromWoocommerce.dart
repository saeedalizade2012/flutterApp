import 'package:flutter/cupertino.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
class FetchDataFromWoocommerce{
  String endPoint ;
  Map dataMap ;
  // Initialize the API
  WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
      url: "https://www.golabsara.ir",
      consumerKey: "ck_34bcf87e427da810b234317683b8ca87d32f8ede",
      consumerSecret: "cs_df6994e3d0cb8fe115ae0c34bc1929c58ada0999"
  );
  FetchDataFromWoocommerce({@required this.endPoint , this.dataMap});
  getCategories() async {
    // Get data using the "products" endpoint
    var categoriesProduct = await wooCommerceAPI.getAsync(this.endPoint);
        List  categories = [];
      for (var category in categoriesProduct) {
        if (category['image'] != null && category['image']['src'] != null && category['image']['src'] != false) {
          categories.add(category);
        }

    }
    return categories;
  }
}
