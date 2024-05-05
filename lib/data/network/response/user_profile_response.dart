import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/account_response.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

part 'user_profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  final ProfileResponse profile;
  final AccountResponse account;

  UserProfileResponse({required this.profile, required this.account});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}
