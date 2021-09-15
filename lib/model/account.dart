import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Account {
  @HiveField(0)
  @JsonKey(name: "is_blocked")
  bool? isBlocked;
  @HiveField(1)
  @JsonKey(name: "is_email_verified")
  bool? isEmailVerified;
  @HiveField(2)
  @JsonKey(name: "is_enabled")
  bool? isEnabled;
  @HiveField(3)
  @JsonKey(name: "is_phone_verified")
  bool? isPhoneVerified;
  @HiveField(4)
  @JsonKey(name: "id")
  int? id;
  @HiveField(5)
  @JsonKey(name: "login_fails")
  int? loginFails;
  @HiveField(6)
  @JsonKey(name: "status")
  int? status;
  @HiveField(7)
  @JsonKey(name: "user_type")
  int? userType;
  @HiveField(8)
  @JsonKey(name: "created_date")
  String? createdDate;
  @HiveField(9)
  @JsonKey(name: "last_login")
  String? lastLogin;
  @HiveField(10)
  @JsonKey(name: "modified_date")
  String? modifiedDate;
  @HiveField(11)
  @JsonKey(name: "email")
  String? email;
  @HiveField(12)
  @JsonKey(name: "full_name")
  String? fullName;
  @HiveField(13)
  @JsonKey(name: "password")
  String? password;
  @HiveField(14)
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @HiveField(15)
  @JsonKey(name: "registration_token")
  String? registrationToken;
  @HiveField(16)
  @JsonKey(name: "salt_key")
  String? saltKey;

  Account(
      {this.isBlocked,
      this.isEmailVerified,
      this.isEnabled,
      this.isPhoneVerified,
      this.id,
      this.loginFails,
      this.status,
      this.userType,
      this.createdDate,
      this.lastLogin,
      this.modifiedDate,
      required this.email,
      this.fullName,
      this.password,
      this.phoneNumber,
      this.registrationToken,
      this.saltKey});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
