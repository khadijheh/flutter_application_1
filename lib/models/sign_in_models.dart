import 'package:flutter_application_1/core/api/endpoint.dart';

class SignInModels {
  final String token;
  SignInModels({required this.token});

  factory SignInModels.fromJson(Map<String, dynamic> jsonData) {
    return SignInModels(token: jsonData[ApiKey.token]);
  }
}
