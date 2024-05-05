import 'package:json_annotation/json_annotation.dart';

part 'account_response.g.dart';

@JsonSerializable()
class AccountResponse {
  final String email;

  AccountResponse({required this.email});

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}
