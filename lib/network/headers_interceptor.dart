import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';

import 'handle_network_call.dart';

///intercept headers of the url
@lazySingleton
class HeadersInterceptors implements InterceptorContract {
  final HandleNetworkCall handleNetworkCall;

  HeadersInterceptors({required this.handleNetworkCall});

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // final _token = await handleNetworkCall.authToken();

    try {
      data.headers["Content-Type"] = "application/json";
      data.headers["Accept"] = "application/json";
      // data.headers["Authorization"] = "_token";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;

  Future<Map<String, String>> MultiPartHeaders() async {
    // final _token = await handleNetworkCall.authToken();

    return {
      "Accept": "application/json",
      "Authorization": "_token",
    };
  }
}
