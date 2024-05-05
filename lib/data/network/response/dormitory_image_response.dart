import 'package:json_annotation/json_annotation.dart';

part 'dormitory_image_response.g.dart';

@JsonSerializable()
class DormitoryImageResponse {
  final String url;

  DormitoryImageResponse({
    required this.url,
  });

  factory DormitoryImageResponse.fromJson(Map<String, dynamic> json) =>
      _$DormitoryImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DormitoryImageResponseToJson(this);
}
