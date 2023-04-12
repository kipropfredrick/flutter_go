class ServerException implements Exception {}

class LocationException implements Exception {}

class CacheException implements Exception {}

class UnAuthenticatedException implements Exception {
  final String? message;

  UnAuthenticatedException({this.message});
}

class SelectImageException implements Exception {}

class SelectImagePermissionException implements Exception {}

class SelectImageFromCameraException implements Exception {}

class SelectImageFromGalleryException implements Exception {}

class AccountCreationException implements Exception {}

class PermissionException implements Exception {}

class LocationFailureException implements Exception {}

class PermissionNeverAskedException implements Exception {}

class NetworkInfoException implements Exception {}

class ServerMaintainException implements Exception {}

class SelectFileException implements Exception {}

class SelectFileFromPhoneExeption implements Exception {}

class LocationServiceExeption implements Exception {}

class LanguageExeption implements Exception {}

class NotFoundExeption implements Exception {}

class BadRequestExeprion implements Exception {}

class DatabaseExeption implements Exception {}
