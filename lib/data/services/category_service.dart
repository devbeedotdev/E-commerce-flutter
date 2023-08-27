import 'package:shopping_app/data/api/api_manager.dart';

class CategoryService extends ApiManager {
  final String categoryUrl = "/products/categories";
  final String inCategoryUrl = "/products/category/";

  Future<List<dynamic>> getCategories() async {
    final response = await getHttp(categoryUrl);
    return response.data;
  }

  Future<List> getInCategories({required String category}) async {
    final response = await getHttp('$inCategoryUrl$category');
    return response.data;
  }
}
