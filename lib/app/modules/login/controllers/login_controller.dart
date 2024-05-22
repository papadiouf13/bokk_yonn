import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginController extends GetxController {
  static const baseUrl = 'localhost:8080/api/authenticate';
  var isAuthenticated = false.obs;
  var showPassword = true.obs;


  Future<bool> login(String username, String password) async {
    try {
    /*  http.Response response = await http.post(
          Uri.parse('localhost:8080/api/authenticatein'),
          body: {
            'email' : username,
            'password' : password
          }
      );
      print("response");
      print(response);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      } */
    return username == "admin" && password == "admin" ? true :  false ;

    } catch (e) {
      isAuthenticated.value = false;
      return false;
    }
  }

  void logout() {
    isAuthenticated.value = false;
  }
}