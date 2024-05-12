import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/gender_enum.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String? message;
  final ProfileResponseData? data;

  ProfileResponse({
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class ProfileResponseData {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'alamat')
  final String? address;
  @JsonKey(name: 'tgl_lahir')
  final DateTime? dateBirth;
  @JsonKey(name: 'no_hp')
  final String? phoneNumber;
  @JsonKey(name: 'jenis_kelamin')
  final GenderEnum? gender;
  @JsonKey(name: 'pekerjaan')
  final String? occupation;

  ProfileResponseData({
    this.id,
    this.name,
    this.email,
    this.address,
    this.dateBirth,
    this.phoneNumber,
    this.gender,
    this.occupation,
  });

  factory ProfileResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseDataToJson(this);
}
