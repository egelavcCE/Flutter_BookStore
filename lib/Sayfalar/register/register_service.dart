import 'package:bookstore_flutter/project_dio.dart';

class RegisterService with ProjectDioMixin {
  Future<bool> register(String email, String name, String password) async {
    try {
      final response = await service.post('/register', data: {
        'email': email,
        'name': name,
        'password': password,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
