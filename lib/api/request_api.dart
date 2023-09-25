import 'package:citizen_app/utils/secure_storage.dart';
import 'package:dio/dio.dart';

class RequestApi {
  static final RequestApi _instance = RequestApi._internal();

  factory RequestApi() => _instance;

  RequestApi._internal(){
    configInterceptor();
  }

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://citizen-api-production.up.railway.app/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  //config interceptor for dio
  static void configInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler)  async {
          String? token = await SecureStorageUtils.instance.getToken();
          options.headers['Content-Type'] = 'application/json';
          if(token != null){
            options.headers['Authorization'] = 'Bearer $token';
          }


          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        },
      ),
    );
  }

  //get method
  Future<dynamic> get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }

  //post method
  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }

  //put method
  Future<dynamic> put(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.put(path, data: params);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }

  //delete method
  Future<dynamic> delete(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.delete(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }

}