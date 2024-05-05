// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dormitory_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormitoryLocationResponse _$DormitoryLocationResponseFromJson(
        Map<String, dynamic> json) =>
    DormitoryLocationResponse(
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      sublocality: json['sublocality'] as String,
    );

Map<String, dynamic> _$DormitoryLocationResponseToJson(
        DormitoryLocationResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'sublocality': instance.sublocality,
    };
