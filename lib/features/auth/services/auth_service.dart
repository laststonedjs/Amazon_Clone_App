import 'package:amazon_clone_tech387/constants/error_handling.dart';
import 'package:amazon_clone_tech387/constants/utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/user.dart';
import '../../../constants/global_variables.dart';
import 'package:http/http.dart'
    as http; // this is allow us to make http request to url that we want

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created! Login with the same credentials.');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
