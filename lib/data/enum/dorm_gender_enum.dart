import 'package:json_annotation/json_annotation.dart';

enum DormGenderEnum {
  @JsonValue("MALE")
  MALE,
  @JsonValue("FEMALE")
  FEMALE,
  @JsonValue("UNISEX")
  UNISEX,
}
