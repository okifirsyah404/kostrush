// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as String?,
      profile: json['profile'] == null
          ? null
          : ProfileResponse.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
    };
