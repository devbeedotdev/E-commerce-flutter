import 'package:shopping_app/data/api/api_mangaer.dart';
import 'package:shopping_app/model/base_response_model.dart';

class LoginUserService extends ApiManager {
  final String loginUserUrl = "/auth/login";

  Future<BaseResponseModel> loginUser(
      {required username, required password}) async {
    Map<String, dynamic> payload = {"username": username, "password": password};
    final response = await postHttp(loginUserUrl, payload);
    return BaseResponseModel.fromJson(response.data);
  }
}
