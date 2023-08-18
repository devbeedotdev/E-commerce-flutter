import 'package:shopping_app/data/api/api_mangaer.dart';
import 'package:shopping_app/model/categories/get_all_categories_response_model.dart';
import 'package:shopping_app/model/get_in_category/get_in_category.dart';

class ProductService extends ApiManager {
  final String allCategoriesUrl = "/products/categories";
  final String getInCategoriesUrl = "/products/category/jewelery";

  Future<GetAllCategoriesResponseModel> getAllCategories() async {
    final response = await getHttp(allCategoriesUrl);
    return GetAllCategoriesResponseModel.fromJson(response.data);
  }

  Future<GetInCategoryResponseModel> getInCategories() async {
    final response = await getHttp(getInCategoriesUrl);
    return GetInCategoryResponseModel.fromJson(response.data);
  }
}
