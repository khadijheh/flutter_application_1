import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/core/error/exeption.dart';
import 'package:flutter_application_1/core/api/api_consumer.dart';
import 'package:flutter_application_1/core/api/api_interceptor.dart';
import 'package:flutter_application_1/core/api/endpoint.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = Endpoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParemeter,
      bool isformData = false}) async {
    try {
      final response = await dio.delete(path,
          data: isformData ? FormData.fromMap(data) : data,
          queryParameters: queryParemeter);
      return response.data;
    } on DioException catch (e) {
      handelExeption(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParemeter}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParemeter);
      return response.data;
    } on DioException catch (e) {
      handelExeption(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParemeter,
      bool isformData = false}) async {
    try {
      final response = await dio.patch(path,
          data: isformData ? FormData.fromMap(data) : data,
          queryParameters: queryParemeter);
      return response.data;
    } on DioException catch (e) {
      handelExeption(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParemeter,
      bool isformData = false}) async {
    try {
      final response = await dio.post(path,
          data: isformData ? FormData.fromMap(data) : data,
          queryParameters: queryParemeter);
      return response.data;
    } on DioException catch (e) {
      handelExeption(e);
    }
  }
}
