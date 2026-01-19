// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: camel_case_types
class UserModel {
  final String name;
  final String email; 
  final String password;
  final String avatarUrl;
 
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatarUrl': avatarUrl,
    };
  }

  Object? toJson() {}

  
}
