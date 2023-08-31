import 'package:shopping_app/data/controllers/future_manager.dart';
import 'package:shopping_app/data/provider/category/category_provider.dart';
import 'package:shopping_app/view_model/base_vm.dart';

class CategoryViewModel extends BaseViewModel {
  CategoryViewModel(super.ref);

  FutureManager<List<dynamic>> categoryData = FutureManager();
  FutureManager<List> inCategoryData = FutureManager();
  FutureManager<List> fewProductData = FutureManager();
  FutureManager<Map<String, dynamic>> getCartData = FutureManager();
  FutureManager<Map<String, dynamic>> getProductData = FutureManager();
  FutureManager<Map<String, dynamic>> getUserData = FutureManager();
  FutureManager<List> getProductsData = FutureManager();
  FutureManager<List> getHotDealData = FutureManager();

  Future<bool> getHotDeal() async {
    getHotDealData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getHotDeal();
    if (response.isNotEmpty) {
      getHotDealData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      getHotDealData.onError("Data not found");
      notifyListeners();
      return false;
    }
  }

  Future<bool> getUser() async {
    getUserData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getUser();
    if (response.isNotEmpty) {
      getUserData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      getUserData.onError("Data not found");
      notifyListeners();
      return false;
    }
  }

  Future<bool> getProducts() async {
    getProductsData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getProducts();
    if (response.isNotEmpty) {
      getProductsData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      getProductsData.onError("Could not find data");
      notifyListeners();
      return false;
    }
  }

  Future<Map<String, dynamic>> getProduct({required int id}) async {
    getProductData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getProduct(id: id);
    if (response.isNotEmpty) {
      getProductData.onSuccess(response);
      notifyListeners();
      return response["products"];
    } else {
      getProductData.onError("No data Found");
      notifyListeners();
      return {};
    }
  }

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

  Future<bool> getFewProducts() async {
    fewProductData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getFewProducts();
    if (response.isNotEmpty) {
      fewProductData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      fewProductData.onError("No data found");
      notifyListeners();
      return false;
    }
  }

  Future<bool> getCart() async {
    getCartData.load();
    notifyListeners();
    final response = await ref.read(categoryServiceProvider).getCart();
    if (response.isNotEmpty) {
      getCartData.onSuccess(response);
      notifyListeners();
      return true;
    } else {
      getCartData.onError("No data found");
      notifyListeners();
      return false;
    }
  }
}
