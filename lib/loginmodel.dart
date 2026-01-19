class Loginmodel {
  String? username;
  String? password;
// Constructor
  Loginmodel({this.username, this.password});
// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}