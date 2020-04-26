import 'package:dio/dio.dart';
import 'package:fluttter/app/shared/constant.dart';
import 'package:fluttter/app/shared/custom_dio/custom_interceptor.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = BASE_URL;
    client.interceptors.add(CustomInterceptor());
    client.options.connectTimeout = 5000;
  }
}
