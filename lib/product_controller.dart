import 'package:get/get.dart';
import 'api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Products>[].obs;
  final TimbuApi timbuApi;

  ProductController({required this.timbuApi});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      print('Fetching products...');
      isLoading(true);
      var products = await timbuApi.fetchProducts();
      if (products.isNotEmpty) {
        productList.value = products;
      } else {
        Get.snackbar('Error', 'No products available');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
