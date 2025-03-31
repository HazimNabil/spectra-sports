import 'package:jwt_decoder/jwt_decoder.dart';

class TokenDecoder {
  TokenDecoder._();

  static Map<String, dynamic> decode(String token) {
    return JwtDecoder.decode(token);
  }
}
