// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class RegisterParams {
  final String phone;
  final String id_number;
  final String plate_number;
  final String license_number;
  final String password;
  RegisterParams({
    required this.phone,
    required this.id_number,
    required this.plate_number,
    required this.license_number,
    required this.password,
  });

  RegisterParams copyWith({
    String? phone,
    String? id_number,
    String? plate_number,
    String? license_number,
    String? password,
  }) {
    return RegisterParams(
      phone: phone ?? this.phone,
      id_number: id_number ?? this.id_number,
      plate_number: plate_number ?? this.plate_number,
      license_number: license_number ?? this.license_number,
      password: password ?? this.password
    );
  }

  @override
  String toString() {
    return 'RegisterParams(phone:$phone ,id_number:$id_number ,plate_number:$plate_number,license_number:$license_number, password:$password )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterParams &&
        other.phone == phone &&
        other.id_number == id_number &&
        other.plate_number == plate_number &&
        other.license_number == license_number&&
         other.password == password;
  }

  @override
  int get hashCode {
    return 
    phone.hashCode ^
        id_number.hashCode ^
        plate_number.hashCode ^
        license_number.hashCode^
    password.hashCode;
  }

  Map<String, String> toMap() {
    final result = <String, String>{};

    result.addAll({'phone': phone});
    result.addAll({'id_number': id_number});
    result.addAll({'plate_number': plate_number});
    result.addAll({'license_number': license_number});
    result.addAll({'password': password});
    return result;
  }

  factory RegisterParams.fromMap(Map<String, dynamic> map) {
    return RegisterParams(
      phone: map['phone'] ?? '',
      id_number: map['id_number'] ?? '',
      plate_number: map['plate_number'] ?? '',
      license_number: map['license_number'] ?? '',
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterParams.fromJson(String source) =>
      RegisterParams.fromMap(json.decode(source));
}
