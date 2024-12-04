import 'package:flutter_application_1/core/api/endpoint.dart';

class ErrorModel {
  final int status;
  final String ErrorMessage;

  ErrorModel({required this.status, required this.ErrorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
        status: jsonData[ApiKey.status],
        ErrorMessage: jsonData[ApiKey.errorMessage]);
  }
}
