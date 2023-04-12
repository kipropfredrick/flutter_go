// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:finance/constants/constants.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// import '../data/local_source.dart';
import 'package:injectable/injectable.dart';
// import 'package:uuid/uuid.dart';

@lazySingleton
class HandleNetworkCall {
  // final LocalSource localSource;
  // final FirebaseMessaging messaging;

  // HandleNetworkCall({
  //   required this.localSource,
  //   required this.messaging,
  // });

  bool checkStatusCode(int responseStatus) {
    if (responseStatus == 200 || responseStatus == 201) {
      return true;
    } else if (responseStatus == 401) {
      throw UnAuthenticatedException();
    } else if (responseStatus == 404) {
      throw NotFoundExeption();
    } else if (responseStatus == 500 || responseStatus == 502) {
      throw ServerException();
    } else if (responseStatus == 503) {
      throw ServerMaintainException();
    } else {
      return false;
    }
  }

  // Future<String> authToken() async {
  //   try {
  //     final _user = await localSource.getUser();

  //     return _user?.token ?? '';
  //   } catch (e) {
  //     return '';
  //   }
  // }

  // Future<String> fetchDeviceInfo() async {
  //   try {
  //     return await localSource.fetchDeviceInfo();
  //   } catch (e) {
  //     return '';
  //   }
  // }

  // Future<String> getFcmToken() async {
  //   try {
  //     return await messaging.getToken() ?? '';
  //   } catch (e) {
  //     return '';
  //   }
  // }

  // String generateUUID() {
  //   return Uuid().v4();
  // }

  String returnFailure(final exception) {
    if (exception is ServerException)
      return SERVER_FAILURE_MESSAGE;
    else if (exception is CacheException)
      return CACHE_FAILURE_MESSAGE;
    else if (exception is ServerMaintainException)
      return SERVER_MAINTAINCE_FAILURE_MESSAGE;
    else if (exception is NotFoundExeption) return NOT_FOUND_MESSAGE;

    return SERVER_FAILURE_MESSAGE;
  }
}

class CacheException implements Exception {
}

class ServerMaintainException implements Exception {
}

class ServerException implements Exception {
}

class NotFoundExeption implements Exception{
}

class UnAuthenticatedException implements Exception {

}
