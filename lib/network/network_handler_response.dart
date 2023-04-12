import 'dart:convert';

class NetworkErrorHandler {
  static String setError(String errorValue) {
    String value = '';

    if (errorValue.length > 1 && jsonDecode(errorValue)["errors"] != null) {
      Map<String, dynamic> errors = jsonDecode(errorValue)["errors"];
      final error = errors.values.first;
      if (!(error is String) && error.length > 0) {
        value = error[0];
      } else {
        value = error;
      }
    } else if (jsonDecode(errorValue)["message"] != null) {
      value = jsonDecode(errorValue)["message"];
    } else if (errorValue.length > 1) {
      value = jsonDecode(errorValue)["error"];
    } else {
      value = "Something went wrong";
    }
    return value;
  }
}
