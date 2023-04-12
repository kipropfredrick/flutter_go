// ignore_for_file: non_constant_identifier_names, avoid_single_cascade_in_expression_statements

import 'dart:convert';

import 'package:finance/network/headers_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:finance/postFields/register.dart';
import 'package:injectable/injectable.dart';

abstract class ApiSource {
  Future<http.Response> registerUser(RegisterParams params);
  Future<http.Response> loginUser(String email, String password);
  Future<http.Response> registerUsers(
    String phone,
    String email,
    String fname,
    String lname,
  );
}

@LazySingleton(as: ApiSource)
class ApiSourceImpl implements ApiSource {
  final HeadersInterceptors headersInterceptors;
  late http.Client client;

  ApiSourceImpl({required this.headersInterceptors}) {
    client = InterceptedClient.build(
      interceptors: [
        // LoggingInterceptor(),
        headersInterceptors,
      ],
      requestTimeout: Duration(seconds: 60),
    );
  }
  Uri _appUrl(_url, [Map<String, dynamic>? queryParameters]) {
    final BASE_URL = dotenv.env['BASE_URL'];
    final API_URL = dotenv.env['API_URL'];
    return Uri.https("$BASE_URL", "$API_URL/$_url", queryParameters);
  }

  Future<http.MultipartRequest> _clientRequest(Uri _uri) async {
    http.MultipartRequest _request = http.MultipartRequest(
      'POST',
      _uri,
    );

    final _headers = await headersInterceptors.MultiPartHeaders();
    _request..headers.addAll(_headers);

    return _request;
  }

  @override
  Future<http.Response> registerUser(RegisterParams params) async {
    // final _request = await _clientRequest(_appUrl('create'));
    print(jsonEncode(params.toMap()));
    final _request =
        await client.post(_appUrl('create'), body: jsonEncode(params.toMap()));
    // _request.fields.addAll(params.toMap());

    // return http.Response.fromStream(await _request.send());
    return _request;
  }

  @override
  Future<http.Response> loginUser(String email, String password) async {
    // final _request = await _clientRequest(_appUrl('create'));
    final _query = {"email": email, "password": password};
    final _request = await client.post(_appUrl('login'), body: _query);
    // _request.fields.addAll(params.toMap());

    // return http.Response.fromStream(await _request.send());
    return _request;
  }

  // initial user registration
  @override
  Future<http.Response> registerUsers(
    String phone,
    String email,
    String fname,
    String lname,
  ) async {
    // final _request = await _clientRequest(_appUrl('create'));
    final _query = {
      "first_name": fname,
      "last_name": lname,
      "phone": phone,
      "email": email,
    };
    print(_query);
    final _request =
        await client.post(_appUrl('register'), body: jsonEncode(_query));
    // _request.fields.addAll(params.toMap());

    // return http.Response.fromStream(await _request.send());
    return _request;
  }
}
