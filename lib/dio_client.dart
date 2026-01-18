import 'package:dio/dio.dart';
import 'package:flutter_proj/usermodel.dart';

class Apiservice {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://api.escuelajs.co/api/v1/"));

  Future<void> createUser(UserModel model) async {
    try {
      await dio.post("users/");
    }on DioException catch (e) {
      print("Error creating user: ${e.message}");
    }
  }
}