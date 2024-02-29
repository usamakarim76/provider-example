import 'package:flutter/cupertino.dart';
import "package:http/http.dart";

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password},
          // headers: {"token": "QpwL5tke4Pnpja7X4"}
      );
      print(response.statusCode);
      print(response.reasonPhrase);
      if (response.statusCode == 200) {
        print("Login");
        setLoading(false);
      } else {
        setLoading(false);
        print("Login Failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
