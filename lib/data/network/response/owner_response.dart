import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

part 'owner_response.g.dart';

@JsonSerializable()
class Owner {
  final String? id;
  final ProfileResponse? profile;

  Owner({
    this.id,
    this.profile,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
