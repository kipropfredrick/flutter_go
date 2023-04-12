// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';

import 'package:finance/data_source/api_source.dart';
import 'package:finance/models/user_model.dart';
import 'package:finance/network/handle_network_call.dart';
import 'package:finance/postFields/register.dart';
import 'package:finance/responses/user_response.dart';
import 'package:injectable/injectable.dart';

import '../repo_source/local/local_resource.dart';

abstract class RemoteSource {
  Future<UserResponse> registerUser(RegisterParams params);
  Future<UserResponse> loginUser(String email, String password);
  Future<UserResponse> registerUsers(
    String phone,
    String email,
    String fname,
    String lname,
  );
}

@LazySingleton(as: RemoteSource)
class RemoteSourceImpl implements RemoteSource {
  final ApiSource apiSource;
  final LocalStorageManager? localStorageManager;
  final HandleNetworkCall networkCall;
  RemoteSourceImpl(
      {required this.networkCall,
      required this.apiSource,
      this.localStorageManager});
  @override
  Future<UserResponse> registerUser(RegisterParams params) async {
    try {
      // print(params);
      final _res = await apiSource.registerUser(params);
      // print(_res.statusCode);
      final _status = networkCall.checkStatusCode(_res.statusCode);

      if (!_status) return UserResponse.withError(_res.body);

      Map<String, dynamic> _body = jsonDecode(_res.body);
      final _user = UserModel.fromJson(_body['data']);
      print(_user);

      // final _agent = AgentModel.fromJson(_body['agent']);
      final _message = _body['message'] as String;

      return UserResponse(user: _user, message: _message);
    } catch (e, S) {
      print(S);
      print(e);
      rethrow;
    }
  }

  @override
  Future<UserResponse> loginUser(
    String email,
    String password,
  ) async {
    try {
      print("params" + email + "=" + password);
      final _res = await apiSource.loginUser(email, password);
      print(_res.statusCode);
      final _status = networkCall.checkStatusCode(_res.statusCode);

      if (!_status) return UserResponse.withError(_res.body);

      Map<String, dynamic> _body = jsonDecode(_res.body);
      final _user = UserModel.fromJson(_body);
      print(_user);

      // final _agent = AgentModel.fromJson(_body['agent']);
      final _message = _body['message'] as String;

      return UserResponse(user: _user, message: _message);
    } catch (e, S) {
      print(S);
      print(e);
      rethrow;
    }
  }

  //
  @override
  Future<UserResponse> registerUsers(
    String phone,
    String email,
    String fname,
    String lname,
  ) async {
    try {
      // print("params"+email+"="+password);
      final _res = await apiSource.registerUsers(phone, email, fname, lname);
      print(_res.statusCode);
      final _status = networkCall.checkStatusCode(_res.statusCode);

      if (!_status) return UserResponse.withError(_res.body);

      Map<String, dynamic> _body = jsonDecode(_res.body);
      final _user = UserModel.fromJson(_body['data']);
      print(_user);

      // final _agent = AgentModel.fromJson(_body['agent']);
      final _message = _body['message'] as String;

      return UserResponse(user: _user, message: _message);
    } catch (e, S) {
      print(S);
      print(e);
      rethrow;
    }
  }
}
