import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
  // get Token
  Future<bool> getToken(String email, String password) async {
    try {
      var response = await Dio().post(
        'http://10.0.2.2:8000/api/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var responseData = response.data;

        // Cek apakah responseData adalah String atau JSON
        String? token;
        if (responseData is String) {
          // Jika responsenya String langsung
          token = responseData;
        } else if (responseData is Map<String, dynamic>) {
          // Jika responsenya JSON
          token = responseData['token'];
        }

        if (token != null && token.isNotEmpty) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          print("Token berhasil disimpan: $token");
          return true;
        }
      }

      print("Login gagal: Respon tidak sesuai");
      return false;
    } catch (error) {
      print("Error saat login: $error");
      return false;
    }
  }

  //get user data
  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('http://10.0.2.2:8000/api/user',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (token.isEmpty) {
        return 'Error: Token is empty';
      }
      // if (user.statusCode == 200 && user.data != '') {
      //   return json.encode(user.data);
      // }
      if (user.statusCode == 200 && user.data != null) {
        return user.data; // Jangan encode ulang, cukup return data JSON
      }
    } catch (error) {
      return error;
    }
  }

  //register new user
  Future<bool> registerUser(
      String username, String email, String password) async {
    try {
      var user = await Dio().post(
        'http://10.0.2.2:8000/api/register',
        data: {'name': username, 'email': email, 'password': password},
      );
      if (user.statusCode == 201 && user.data != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error registering user: $error"); // logging error
      return false;
    }
  }
}
