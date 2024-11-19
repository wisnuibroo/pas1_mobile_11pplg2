import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_33/service/api_service_login.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginStatus = "".obs;
  var token = "".obs;

  final ApiServiceLogin _loginService = ApiServiceLogin();

  Future<bool> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _loginService.login(username, password);
      if (response["status"] == true) {
        // loginStatus.value = response["message"];
        token.value = response["token"];
        return true;
      } else {
        loginStatus.value = "Login Gagal";
        return false;
      }
    } catch (e) {
      loginStatus.value = "Error: ${e.toString()}";
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
