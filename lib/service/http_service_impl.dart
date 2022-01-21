// ignore_for_file: constant_identifier_names, avoid_print

import 'package:dio/dio.dart';
import 'package:news_app_byusing_getx/service/http_service.dart';

const base_url = "https://newsapi.org/";
const api_key = "72895325ab4c46e9834e10aa5969dc0a";

class HttpServiceImpl extends HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
      print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    // return response;
  }

  initialzeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, ErrorInterceptorHandler) => print(error.message),
        onRequest: (requestOptions, requestInterceptorHandler) {
          print("${requestOptions.method} | ${requestOptions.path}");
        },
        onResponse: (response, ResponseInterceptorHandler) {
          print(
              "${response.statusCode} | ${response.statusMessage} | ${response.data}");
        },
      ),
    );
  }

  @override
  void init() {
    // TODO: implement init
    _dio = Dio(
      BaseOptions(
        baseUrl: base_url,
        headers: {"Authorization": "Bearer $api_key"},
      ),
    );
  }
}
