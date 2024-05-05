import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String name;
  final String? phoneNumber;
  final String? occupation;
  final String? address;
  final String? imageAvatar;

  ProfileResponse({
    required this.name,
    this.phoneNumber,
    this.occupation,
    this.address,
    this.imageAvatar,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
