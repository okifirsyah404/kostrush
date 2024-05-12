// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kost_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KostResponse _$KostResponseFromJson(Map<String, dynamic> json) => KostResponse(
      kosts: (json['kosts'] as List<dynamic>?)
          ?.map((e) => Kost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KostResponseToJson(KostResponse instance) =>
    <String, dynamic>{
      'kosts': instance.kosts,
    };
