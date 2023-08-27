import 'package:shopping_app/data/api/api_manager.dart';
import 'package:shopping_app/data/helpers/storage_helper.dart';

class OnboardingService extends ApiManager {
  final String loginUrl = "/auth/login";
  final String signUpUrl = "/users";
  final String updateUserUrl = "/users/7";

  String? token = StorageHelper.getString("token") ?? " ";

  Future<Map<String, dynamic>> login(
      {required username, required password}) async {
    Map<String, dynamic> payload = {"username": username, "password": password};
    final response = await postHttp(loginUrl, payload);
    return response.data;
  }

  Future<Map<String, dynamic>> signUp(
      {required username, required password, required email}) async {
    Map<String, dynamic> payload = {
      "email": email,
      "username": username,
      "password": password,
      "name": {"firstname": 'John', "lastname": 'Doe'},
      "address": {
        "city": 'kilcoole',
        "street": '7835 new road',
        "number": 3,
        "zipcode": '12926-3874',
        "geolocation": {"lat": '-37.3159', "long": '81.1496'}
      },
      "phone": '1-570-236-7033'
    };
    final response = await postHttp(signUpUrl, payload);
    return response.data;
  }
}
