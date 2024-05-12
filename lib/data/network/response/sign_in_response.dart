import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  final SignInData? data;
  final String? token;
  final String? message;

  SignInResponse({
    this.data,
    this.token,
    this.message,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable()
class SignInData {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic verificationToken;
  final String? role;

  @JsonKey(name: 'alamat')
  final String? address;
  @JsonKey(name: 'pekerjaan')
  final String? occupation;
  @JsonKey(name: 'tgl_lahir')
  final DateTime? birthDate;
  @JsonKey(name: 'no_hp')
  final String? phoneNumber;
  @JsonKey(name: 'jenis_kelamin')
  final String? gender;
  @JsonKey(name: 'foto_ktp')
  final dynamic idCardPhoto;
  @JsonKey(name: 'id_kost')
  final dynamic dormId;
  @JsonKey(name: 'id_kamar')
  final dynamic roomId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SignInData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.verificationToken,
    this.role,
    this.address,
    this.occupation,
    this.birthDate,
    this.phoneNumber,
    this.dormId,
    this.roomId,
    this.gender,
    this.idCardPhoto,
    this.createdAt,
    this.updatedAt,
  });

  factory SignInData.fromJson(Map<String, dynamic> json) =>
      _$SignInDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDataToJson(this);
}
