import 'package:shopping_app/data/api/api_manager.dart';

class CategoryService extends ApiManager {
  final String categoryUrl = "/products/categories";
  final String inCategoryUrl = "/products/category/";
  final String fewProductsUrl = "/products?limit=5";
  final String cartUrl = "/carts/2";
  final String productUrl = "/products/";
  final String productsUrl = "/products";
  final String userUrl = "/users/3";
  final String hotDealUrl = "/products?sort=desc";

  Future<List> getHotDeal() async {
    final response = await getHttp(hotDealUrl);
    return response.data;
  }

  Future<Map<String, dynamic>> getUser() async {
    final response = await getHttp(userUrl);
    return response.data;
  }

  Future<List<dynamic>> getProducts() async {
    final response = await getHttp(productsUrl);
    return response.data;
  }

  Future<List<dynamic>> getCategories() async {
    final response = await getHttp(categoryUrl);
    return response.data;
  }

  Future<List> getInCategories({required String category}) async {
    final response = await getHttp('$inCategoryUrl$category');
    return response.data;
  }

  Future<List> getFewProducts() async {
    final response = await getHttp(fewProductsUrl);
    return response.data;
  }

  Future<Map<String, dynamic>> getProduct({required int id}) async {
    final response = await getHttp("$productUrl$id");
    return response.data;
  }

  Future<Map<String, dynamic>> getCart() async {
    final response = await getHttp(cartUrl);
    return response.data;
  }
}
