// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 0;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      isBlocked: fields[0] as bool?,
      isEmailVerified: fields[1] as bool?,
      isEnabled: fields[2] as bool?,
      isPhoneVerified: fields[3] as bool?,
      id: fields[4] as int?,
      loginFails: fields[5] as int?,
      status: fields[6] as int?,
      userType: fields[7] as int?,
      createdDate: fields[8] as String?,
      lastLogin: fields[9] as String?,
      modifiedDate: fields[10] as String?,
      email: fields[11] as String?,
      fullName: fields[12] as String?,
      password: fields[13] as String?,
      phoneNumber: fields[14] as String?,
      registrationToken: fields[15] as String?,
      saltKey: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.isBlocked)
      ..writeByte(1)
      ..write(obj.isEmailVerified)
      ..writeByte(2)
      ..write(obj.isEnabled)
      ..writeByte(3)
      ..write(obj.isPhoneVerified)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.loginFails)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.userType)
      ..writeByte(8)
      ..write(obj.createdDate)
      ..writeByte(9)
      ..write(obj.lastLogin)
      ..writeByte(10)
      ..write(obj.modifiedDate)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.fullName)
      ..writeByte(13)
      ..write(obj.password)
      ..writeByte(14)
      ..write(obj.phoneNumber)
      ..writeByte(15)
      ..write(obj.registrationToken)
      ..writeByte(16)
      ..write(obj.saltKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    isBlocked: json['is_blocked'] as bool?,
    isEmailVerified: json['is_email_verified'] as bool?,
    isEnabled: json['is_enabled'] as bool?,
    isPhoneVerified: json['is_phone_verified'] as bool?,
    id: json['id'] as int?,
    loginFails: json['login_fails'] as int?,
    status: json['status'] as int?,
    userType: json['user_type'] as int?,
    createdDate: json['created_date'] as String?,
    lastLogin: json['last_login'] as String?,
    modifiedDate: json['modified_date'] as String?,
    email: json['email'] as String?,
    fullName: json['full_name'] as String?,
    password: json['password'] as String?,
    phoneNumber: json['phone_number'] as String?,
    registrationToken: json['registration_token'] as String?,
    saltKey: json['salt_key'] as String?,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'is_blocked': instance.isBlocked,
      'is_email_verified': instance.isEmailVerified,
      'is_enabled': instance.isEnabled,
      'is_phone_verified': instance.isPhoneVerified,
      'id': instance.id,
      'login_fails': instance.loginFails,
      'status': instance.status,
      'user_type': instance.userType,
      'created_date': instance.createdDate,
      'last_login': instance.lastLogin,
      'modified_date': instance.modifiedDate,
      'email': instance.email,
      'full_name': instance.fullName,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'registration_token': instance.registrationToken,
      'salt_key': instance.saltKey,
    };
