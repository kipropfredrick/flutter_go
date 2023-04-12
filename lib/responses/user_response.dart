import 'package:finance/network/network_handler_response.dart';
import 'package:finance/models/user_model.dart';

class UserResponse {
  UserModel? user;
  // AgentModel? agent;
  // ProfileInfoModel? info;
  final String? error;
  final String? message;

  UserResponse({
    required this.user,
    // required this.agent,
    // this.info,
    this.error,
    this.message,
  });

  UserResponse.withError(String error)
      : user = null,
        // agent = null,
        message = null,
        error = NetworkErrorHandler.setError(error);

  UserResponse copyWith({
    UserModel? user,
    // AgentModel? agent,
    // ProfileInfoModel? info,
    String? error,
    String? message,
  }) {
    return UserResponse(
      user: user ?? this.user,
      // agent: agent ?? this.agent,
      // info: info ?? this.info,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'UserResponse(user: $user,error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserResponse &&
        other.user == user &&
        // other.agent == agent &&
        // other.info == info &&
        other.error == error &&
        other.message == message;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        // agent.hashCode ^
        // info.hashCode ^
        error.hashCode ^
        message.hashCode;
  }
}