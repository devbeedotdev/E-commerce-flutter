import 'package:shopping_app/data/api/api_mangaer.dart';
import 'package:shopping_app/model/base_response_model.dart';
import 'package:shopping_app/model/cart/get_user_cart.dart';

class CartService extends ApiManager {
  final String userCartUrl = "/carts/";
  final String addNewProductToCartUrl = "/carts";

  Future<GetUserCartResponseModel> getUserCart(int id) async {
    final response = await getHttp("userCartUrl$id");
    return GetUserCartResponseModel.fromJson(response.data);
  }

  Future<BaseResponseModel> addNewProductToCart() async {
    final response = await getHttp(addNewProductToCartUrl);
    return BaseResponseModel.fromJson(response.data);
  }
}
