import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class EncryptUtil {
  static const List<int> bytes = [8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8];

  //aes加密
  String aesEncode(String content) {
    try {
      final key = Key.fromBase64(base64Encode(bytes));
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(content, iv: IV.fromBase64(base64Encode(bytes)));
      return encrypted.base64;
    } catch (err) {
      print("aes encode error:$err");
      return content;
    }
  }

  //aes解密
  dynamic aesDecode(dynamic base64) {
    try {
      final key = Key.fromBase64(base64Encode(bytes));
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      return encrypter.decrypt64(base64, iv: IV.fromBase64(base64Encode(bytes)));
    } catch (err) {
      print("aes decode error:$err");
      return base64;
    }
  }
}
