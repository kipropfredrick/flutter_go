// ignore_for_file: unused_element

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageManager {
  // LocalStorageManager._();
  static const _androidOptions =
      AndroidOptions(encryptedSharedPreferences: true);
  static const _iosOptions =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static const FlutterSecureStorage _secureStorage =
      FlutterSecureStorage(iOptions: _iosOptions, aOptions: _androidOptions);

  static Future<void> setStringEmail(String email) async {
    await _secureStorage.write(key: "_email", value: email);
  }

  Future<void> setPassword(String password) async {
    await _secureStorage.write(key: "_email", value: password);
  }
Future<void> setId(String uid) async {
    await _secureStorage.write(key: "_uid", value: uid);
  }
   Future<void> setUserList<T>(String userList, List<T> ulist) async {
    String userListBuffer = json.encode(ulist);
    await _secureStorage.write(key: userList,value:userListBuffer);
  }
  // getters
  Future<String?> getEmail(String email) async {
return await _secureStorage.read(key: email);
  }
  Future<String?> getUid(String uid) async {
return await _secureStorage.read(key: uid);
  }
  Future<String?> getUsers(String keys) async {
    return await _secureStorage.read(key: keys);
  }
}
