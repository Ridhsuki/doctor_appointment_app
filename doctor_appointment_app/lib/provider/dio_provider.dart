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
    // try {
    //   var response = await Dio().post(
    //     'http://10.0.2.2:8000/api/login',
    //     data: {'email': email, 'password': password},
    //   );

    //   print("Response: ${response.data}"); // Debugging

    //   if (response.statusCode == 200 && response.data != null) {
    //     if (response.data is Map<String, dynamic>) {
    //       // Pastikan response adalah JSON
    //       final token = response.data['token']; // Ambil token dari JSON
    //       if (token != null && token.isNotEmpty) {
    //         final SharedPreferences prefs =
    //             await SharedPreferences.getInstance();
    //         await prefs.setString('token', token);
    //         return true;
    //       }
    //     }
    //   }
    //   return false;
    // } catch (error) {
    //   print("Error in getToken: $error"); // Debugging
    //   return false; // Harus kembalikan boolean, bukan string
    // }

    // try {
    //   var response = await Dio().post('http://10.0.2.2:8000/api/login',
    //       data: {'email': email, 'password': password});
    //   if (response.statusCode == 200 && response.data != null) {
    //     final token = response.data['token']; // Ambil token dari JSON
    //     if (token != null) {
    //       final SharedPreferences prefs = await SharedPreferences.getInstance();
    //       await prefs.setString('token', token);
    //       return true;
    //     }
    //   }
    //   return false;
    //   // if (response.statusCode == 200 && response.data != '') {
    //   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   //   await prefs.setString('token', response.data);
    //   //   return true;
    //   // } else {
    //   //   return false;
    //   // }
    // } catch (error) {
    //   return error;
    // }
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
}
