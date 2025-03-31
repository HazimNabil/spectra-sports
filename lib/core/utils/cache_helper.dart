import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  CacheHelper._();

  static const _secureStorage = FlutterSecureStorage();

  static Future<void> setSecureData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String> getSecureData(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  static Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }
}
