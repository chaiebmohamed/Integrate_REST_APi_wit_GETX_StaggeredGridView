import 'package:get/state_manager.dart';
import 'package:shop/models/product.dart';
import 'package:shop/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = List<Product>().obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
