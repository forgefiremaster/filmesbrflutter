import 'package:dio/dio.dart';
import 'package:fluttter/app/shared/constant.dart';

class CustomInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST:[${options.method}]  =>  PATH:[${options.path}]");
    options.headers = {"Authorization": API_KEY};
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // 200
    // 201
    print(
        "RESPONSE:[${response.statusCode}]  =>  PATH:[${response.request.path}]");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR:[${err.response.statusCode}]  =>  PATH:[${err.request.path}]");
    return super.onError(err);
  }
}
