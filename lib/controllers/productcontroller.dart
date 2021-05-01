import 'package:get/state_manager.dart';
import '../services/remortservices.dart';

import '../models/product.dart';
//import 'package:shopx/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  //var productList = List<Product>().obs;
  //
  //
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemortServices.fetchProducts();
      if (productList != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
