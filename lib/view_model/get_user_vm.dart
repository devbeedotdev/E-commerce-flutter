import 'package:dio/dio.dart';
import 'package:shopping_app/data/controllers/future_manager.dart';
import 'package:shopping_app/data/helpers/storage_helper.dart';
import 'package:shopping_app/data/provider/onboarding/onboarding_provider.dart';
import 'package:shopping_app/model/base_response_model.dart';
import 'package:shopping_app/view_model/base_vm.dart';

class OnboardingViewModel extends BaseViewModel {
  OnboardingViewModel(super.ref);

  FutureManager<BaseResponseModel> loginData = FutureManager();
  FutureManager<BaseResponseModel> signUpData = FutureManager();

  Future<bool> elogin(
      {required String username, required String password}) async {
    Dio dio = Dio();
    loginData.load();
    notifyListeners();
    try {
      final response = await dio.post("https://fakestoreapi.com/auth/login",
          data: {"username": username, "password": password});
      if (response.statusCode == 200) {
        await StorageHelper.setString('token', response.data["token"] ?? '');
        loginData.stop(BaseResponseModel.fromJson(response.data));
        //loginData.onSuccess(BaseResponseModel.fromJson(value));

        notifyListeners();
        return true;
      } else {
        loginData.onError("Error occured");
        notifyListeners();
        return false;
      }
    } catch (e) {
      loginData.onError("Invalid Credentials");
      notifyListeners();
      return false;
    }
  }

  // Future<bool> login(
  //     {required String username, required String password}) async {
  //   loginData.load();
  //   notifyListeners();

  //   return ref
  //       .read(onboardingServiceProvider)
  //       .login(username: username, password: password)
  //       .then((value) async {
  //     if (value["token"] != null) {
  //       await StorageHelper.setString('token', value["token"] ?? '');
  //       loginData.stop(BaseResponseModel.fromJson(value));
  //       //loginData.onSuccess(BaseResponseModel.fromJson(value));

  //       notifyListeners();
  //       return true;
  //     } else {
  //       loginData.onError("Error occured");
  //       notifyListeners();
  //       return false;
  //     }
  //   });
  // }

  Future<bool> signUp(
      {required String username,
      required String password,
      required String email}) async {
    signUpData.load();
    notifyListeners();
    return ref
        .read(onboardingServiceProvider)
        .signUp(username: username, password: password, email: email)
        .then((value) {
      if (value["id"] != null) {
        signUpData.onSuccess(BaseResponseModel.fromJson(value));
        notifyListeners();
        return true;
      } else {
        signUpData.onError("An error occured in signup");
        notifyListeners();
        return false;
      }
    });
  }
}
