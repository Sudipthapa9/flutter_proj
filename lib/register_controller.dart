import 'package:dio/dio.dart';
import 'package:flutter_proj/dio_client.dart';
import 'package:flutter_proj/usermodel.dart';
import 'package:get/get.dart';

class UserController extends Getxcontroller {
 final Apiservice apiService = Apiservice();

  var isLoading = false.obs;

  Future<void> createUser(
    {
      required String name,
      required String email,
      required String password,
      required String avatarUrl,
    }
  ) async {
   try{
     isLoading.value = true;
    final user = UserModel(
      name: name,
      email: email,
      password: password,
      avatarUrl: avatarUrl,
    );

    await apiService.createUser(user);
    isLoading = false.obs;
    Get.snackbar("Success", "User registered successfully" , snackPosition: SnackPosition.BOTTOM);
    Get.showSnackbar(GetSnackBar(
      title: "Success",
      message: "User registered successfully",
      duration: Duration(seconds: 3),
    ));
   } catch (e) {
    isLoading = false.obs;
    Get.snackbar("Error", "Failed to register user: $e");  
    Get.showSnackbar(GetSnackBar(
      title: "Error",
      message: "Failed to register user: $e",
      duration: Duration(seconds: 3),
    ));  
  }
    finally {
      isLoading.value = false;
    }
    }
}
class Getxcontroller {
} 
