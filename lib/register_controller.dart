import 'package:flutter_proj/dio_client.dart';
import 'package:flutter_proj/usermodel.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final ApiService apiService = ApiService();

  final RxBool isLoading = false.obs;

  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String avatarUrl,
  }) async {
    isLoading.value = true;

    try {
      final user = UserModel(
        name: name,
        email: email,
        password: password,
        avatarUrl: avatarUrl, // if your model uses "avatar", change this line
      );

      await apiService.createUser(user);

      Get.snackbar(
        "Success",
        "User registered successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to register user: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
