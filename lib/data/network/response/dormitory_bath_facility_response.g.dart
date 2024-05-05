// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dormitory_bath_facility_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormitoryBathFacilityResponse _$DormitoryBathFacilityResponseFromJson(
        Map<String, dynamic> json) =>
    DormitoryBathFacilityResponse(
      shower: json['shower'] as bool,
      toilet: json['toilet'] as bool,
      sink: json['sink'] as bool,
    );

Map<String, dynamic> _$DormitoryBathFacilityResponseToJson(
        DormitoryBathFacilityResponse instance) =>
    <String, dynamic>{
      'shower': instance.shower,
      'toilet': instance.toilet,
      'sink': instance.sink,
    };
