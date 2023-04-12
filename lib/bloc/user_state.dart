part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  success,
  verifySent,
  logOut,
  failure,
  refreshFailure
}

extension UserStatusX on UserStatus {
  bool get isInitial => this == UserStatus.initial;
  bool get isLoading => this == UserStatus.loading;
  bool get isSuccess => this == UserStatus.success;
  bool get isVerifySent => this == UserStatus.verifySent;
  bool get isLogOut => this == UserStatus.logOut;
  bool get isFailure => this == UserStatus.failure;
  bool get isRefreshFailure => this == UserStatus.refreshFailure;
}

class AuthState {
  final UserStatus status;
  final UserResponse? user;
  final String? message;

  AuthState({
    this.status = UserStatus.initial,
    this.user,
    this.message,
  });

  AuthState copyWith({
    UserStatus? status,
    UserResponse? user,
    String? message,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  @override
  String toString() =>
      'AuthState(status: $status, user: $user, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.status == status &&
        other.user == user &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ user.hashCode ^ message.hashCode;
}
