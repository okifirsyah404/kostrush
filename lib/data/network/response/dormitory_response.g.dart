// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dormitory_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormitoryResponse _$DormitoryResponseFromJson(Map<String, dynamic> json) =>
    DormitoryResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      availableRoom: json['availableRoom'] as int,
      dormitoryGender:
          $enumDecode(_$DormGenderEnumEnumMap, json['dormitoryGender']),
      dormitoryType: json['dormitoryType'] as String,
      dormitoryFacility: DormitoryFacilityResponse.fromJson(
          json['dormitoryFacility'] as Map<String, dynamic>),
      dormitoryBathFacility: DormitoryBathFacilityResponse.fromJson(
          json['dormitoryBathFacility'] as Map<String, dynamic>),
      dormitoryRules: DormitoryRulesResponse.fromJson(
          json['dormitoryRules'] as Map<String, dynamic>),
      dormitoryLocation: DormitoryLocationResponse.fromJson(
          json['dormitoryLocation'] as Map<String, dynamic>),
      dormitoryImage: (json['dormitoryImage'] as List<dynamic>)
          .map(
              (e) => DormitoryImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      dormitoryPrice: DormitoryPriceResponse.fromJson(
          json['dormitoryPrice'] as Map<String, dynamic>),
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DormitoryResponseToJson(DormitoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'availableRoom': instance.availableRoom,
      'dormitoryGender': _$DormGenderEnumEnumMap[instance.dormitoryGender]!,
      'dormitoryType': instance.dormitoryType,
      'dormitoryFacility': instance.dormitoryFacility,
      'dormitoryBathFacility': instance.dormitoryBathFacility,
      'dormitoryRules': instance.dormitoryRules,
      'dormitoryLocation': instance.dormitoryLocation,
      'dormitoryImage': instance.dormitoryImage,
      'dormitoryPrice': instance.dormitoryPrice,
      'owner': instance.owner,
    };

const _$DormGenderEnumEnumMap = {
  DormGenderEnum.MALE: 'MALE',
  DormGenderEnum.FEMALE: 'FEMALE',
  DormGenderEnum.UNISEX: 'UNISEX',
};
