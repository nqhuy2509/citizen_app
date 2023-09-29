import 'package:citizen_app/api/request_api.dart';
import 'package:citizen_app/models/auth_model.dart';

class AuthRepository {
  Future<AuthModel> login(String email, String password) async {
    final response = await RequestApi().post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return AuthModel.fromJson(response);
  }

  Future<dynamic> register (String email, String password, String nationalId) async {
    final response = await RequestApi().post(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'citizenId': nationalId,
      },
    );
    return response;
  }
}