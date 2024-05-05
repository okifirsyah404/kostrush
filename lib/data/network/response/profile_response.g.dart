// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      occupation: json['occupation'] as String?,
      address: json['address'] as String?,
      imageAvatar: json['imageAvatar'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'occupation': instance.occupation,
      'address': instance.address,
      'imageAvatar': instance.imageAvatar,
    };
