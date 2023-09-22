import 'package:citi_zen_app/constants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtils{

  static SecureStorageUtils instance = SecureStorageUtils();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();


  Future<void> saveToken(String token) async {
    await _storage.write(key: Constant.token, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: Constant.token);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: Constant.token);
  }
}