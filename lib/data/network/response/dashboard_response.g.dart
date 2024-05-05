// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    DashboardResponse(
      recomendedDormitories: (json['recomendedDormitories'] as List<dynamic>)
          .map((e) => DormitoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      cheapestDormitories: (json['cheapestDormitories'] as List<dynamic>)
          .map((e) => DormitoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{
      'recomendedDormitories': instance.recomendedDormitories,
      'cheapestDormitories': instance.cheapestDormitories,
    };
