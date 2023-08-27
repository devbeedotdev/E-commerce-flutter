import 'package:shopping_app/data/controllers/future_manager.dart';
import 'package:shopping_app/data/provider/category/category_provider.dart';
import 'package:shopping_app/model/incategory/in_category_response_model.dart';
import 'package:shopping_app/view_model/base_vm.dart';

class CategoryViewModel extends BaseViewModel {
  CategoryViewModel(super.ref);

  FutureManager<List<dynamic>> categoryData = FutureManager();
  FutureManager<List> inCategoryData = FutureManager();

  Future<bool> getCategories() async {
    categoryData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getCategories();
    if (response.isNotEmpty) {
      categoryData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      categoryData.onError("No data found");
      notifyListeners();
      return false;
    }
  }

  Future<bool> getInCategories({required String category}) async {
    inCategoryData.load();
    notifyListeners();
    final response = await ref
        .read(categoryServiceProvider)
        .getInCategories(category: category);
    if (response.isNotEmpty) {
      inCategoryData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      inCategoryData.onError("No data found");
      notifyListeners();
      return false;
    }
  }
}
