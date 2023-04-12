// json annotation
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UserModel {
  @JsonKey(fromJson: _fromJson)
  final int id;
  final String email;
  final String last_name;
  final String? password;
  // final String? name;
  // final String? phone;
  UserModel({
    required this.id,
    required this.email,
    required this.last_name,
    this.password,
    // required this.name,
    // this.phone,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  UserModel copyWith({
    int? id,
    String? email,
    String? last_name,
    String? password,
    // String? name,
    // String? phone
  }) {
    return UserModel(
      id: id ?? this.id,
      // name: name ?? this.name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
      // phone: phone ?? this.phone);
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id,last_name: $last_name, email: $email,password:$password)';
  }

  static int _fromJson(dynamic data) {
    return num.tryParse(data.toString())?.toInt() ?? 0;
  }

  static int? _fromNullableJson(dynamic data) {
    return num.tryParse(data.toString())?.toInt();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        // other.name == name &&
        other.last_name == last_name &&
        other.email == email &&
        other.password == password;
    // other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        // name.hashCode ^
        last_name.hashCode ^
        email.hashCode ^
        password.hashCode;
    // phone.hashCode;
  }
}
