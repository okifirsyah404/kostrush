// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dormitory_facility_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormitoryFacilityResponse _$DormitoryFacilityResponseFromJson(
        Map<String, dynamic> json) =>
    DormitoryFacilityResponse(
      airConditioner: json['airConditioner'] as bool,
      bathroom: json['bathroom'] as bool,
      bed: json['bed'] as bool,
      pillow: json['pillow'] as bool,
      roomHeight: json['roomHeight'] as int?,
      roomLength: json['roomLength'] as int,
      roomWidth: json['roomWidth'] as int,
      wardrobe: json['wardrobe'] as bool,
      wifi: json['wifi'] as bool,
    );

Map<String, dynamic> _$DormitoryFacilityResponseToJson(
        DormitoryFacilityResponse instance) =>
    <String, dynamic>{
      'airConditioner': instance.airConditioner,
      'bathroom': instance.bathroom,
      'bed': instance.bed,
      'pillow': instance.pillow,
      'roomHeight': instance.roomHeight,
      'roomLength': instance.roomLength,
      'roomWidth': instance.roomWidth,
      'wardrobe': instance.wardrobe,
      'wifi': instance.wifi,
    };
