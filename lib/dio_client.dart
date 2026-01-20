import 'package:dio/dio.dart';
import 'package:flutter_proj/getstorage.dart';
import 'package:flutter_proj/usermodel.dart';
/// Service class to handle API requests
class ApiService {
  late final Dio dio;
// Constructor to initialize Dio with base options
  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.escuelajs.co/api/v1/",
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Optional: add token only when you really have one
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // If you don't have a token yet, don't set it here.
          // options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE';
          handler.next(options);
        },
        onResponse: (response, handler) {
          print(response.data);
          handler.next(response);
        },
      ),
    );
  }
/// Method to create a new user
  Future<void> createUser(UserModel model) async {
    try {
      final res = await dio.post(
        "users/",
        data: model.toMap(), // or model.toJson()
      );

      print("User created: ${res.data}");
    } on DioException catch (e) {
      print("Error creating user: ${e.message}");
      print("Response: ${e.response?.data}");
    }
  }
  ///Login method to authenticate user and store token
  Future<void> login(String username, String password) async {
    try {
      final res = await dio.post(
        "auth/login",
        data: {
          'username': username,
          'password': password,
        },
      );

      final accessToken = res.data['access_token'];
      if (accessToken != null) {
        await TokenStorage.saveToken(accessToken);
        print("Login successful, token saved.");
      } else {
        print("Login failed, no token received.");
      }
    } on DioException catch (e) {
      print("Error during login: ${e.message}");
      print("Response: ${e.response?.data}");
    }
  }
}
