// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      data: json['data'] == null
          ? null
          : SignInData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'token': instance.token,
      'message': instance.message,
    };

SignInData _$SignInDataFromJson(Map<String, dynamic> json) => SignInData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'],
      verificationToken: json['verificationToken'],
      role: json['role'] as String?,
      address: json['alamat'] as String?,
      occupation: json['pekerjaan'] as String?,
      birthDate: json['tgl_lahir'] == null
          ? null
          : DateTime.parse(json['tgl_lahir'] as String),
      phoneNumber: json['no_hp'] as String?,
      dormId: json['id_kost'],
      roomId: json['id_kamar'],
      gender: json['jenis_kelamin'] as String?,
      idCardPhoto: json['foto_ktp'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SignInDataToJson(SignInData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'verificationToken': instance.verificationToken,
      'role': instance.role,
      'alamat': instance.address,
      'pekerjaan': instance.occupation,
      'tgl_lahir': instance.birthDate?.toIso8601String(),
      'no_hp': instance.phoneNumber,
      'jenis_kelamin': instance.gender,
      'foto_ktp': instance.idCardPhoto,
      'id_kost': instance.dormId,
      'id_kamar': instance.roomId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
