import 'package:json_annotation/json_annotation.dart';

part 'room_response.g.dart';

@JsonSerializable()
class RoomResponse {
  @JsonKey(name: 'id_kamar')
  final int? id;
  @JsonKey(name: 'nama_kamar')
  final String? name;
  @JsonKey(name: 'harga')
  final int? price;
  @JsonKey(name: 'fasilitas')
  final String? facility;
  @JsonKey(name: 'status_kamar')
  final String? status;

  RoomResponse({
    this.id,
    this.name,
    this.price,
    this.facility,
    this.status,
  });

  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomResponseToJson(this);
}
