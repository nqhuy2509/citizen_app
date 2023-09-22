import 'package:citi_zen_app/utils/secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiConfig{

  static final ApiConfig instance = ApiConfig();

  Future<http.Request> interceptorRequest(http.Request request) async{
    final token = await SecureStorageUtils.instance.getToken();
    if(token !=null){
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
    }
    return request;
  }
}