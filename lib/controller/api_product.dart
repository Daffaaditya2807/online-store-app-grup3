import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:online_app_final_project/model/all_product.dart';

class ProductAllController extends GetxController {
  var isLoading = true.obs;
  var productList = <ModelProductAll>[].obs;
  var isLoadedData = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduk();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      fetchProduk(); // Reload all products if the search query is empty
    } else {
      var filteredProducts = productList.where((product) {
        return product.tittle.toLowerCase().contains(query.toLowerCase());
      }).toList();
      productList.value = filteredProducts;
    }
  }

  void fetchProduk() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        var products =
            jsonData.map((item) => ModelProductAll.fromJson(item)).toList();
        productList.value = products;
      }
    } catch (e) {
      isLoading(false);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

class ProductAllControllerByCategory extends GetxController {
  var isLoading = true.obs;
  var productList = <ModelProductAll>[].obs;
  var productListDetail = <ModelProductAll>[].obs;
  Map<String, bool> hasFetchedCategory = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void searchProductsByCategory(String query, String category) {
    if (query.isEmpty) {
      fetchProdukByCategory(
          category:
              category); // Reload all products if the search query is empty
    } else {
      var filteredProducts = productList.where((product) {
        return product.tittle.toLowerCase().contains(query.toLowerCase());
      }).toList();
      productList.value = filteredProducts;
    }
  }

  void fetchProdukByCategoryDetail({String? category}) async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/category/$category"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        var products =
            jsonData.map((item) => ModelProductAll.fromJson(item)).toList();
        productListDetail.value = products;
      }
    } catch (e) {
      isLoading(false);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void fetchProdukByCategory({String? category}) async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/category/$category"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        var products =
            jsonData.map((item) => ModelProductAll.fromJson(item)).toList();
        productList.value = products;
      }
    } catch (e) {
      isLoading(false);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
