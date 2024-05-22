import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/room_response.dart';

part 'kost_response.g.dart';

@JsonSerializable()
class KostResponse {
  @JsonKey(name: 'id_kost')
  final int? id;
  @JsonKey(name: 'nama_kost')
  final String? name;
  @JsonKey(name: 'alamat')
  final String? address;
  @JsonKey(name: 'kecamatan')
  final String? subLocality;
  @JsonKey(name: 'peraturan')
  final String? rules;
  @JsonKey(name: 'fasilitas')
  final String? facilities;
  @JsonKey(name: 'tipe')
  final String? type;
  @JsonKey(name: "harga_terendah")
  final int? startPrice;
  @JsonKey(name: "harga_tertinggi")
  final int? endPrice;
  @JsonKey(name: 'kamar')
  final List<RoomResponse>? rooms;

  KostResponse({
    this.id,
    this.name,
    this.address,
    this.subLocality,
    this.rules,
    this.facilities,
    this.type,
    this.startPrice,
    this.endPrice,
    this.rooms,
  });

  factory KostResponse.fromJson(Map<String, dynamic> json) =>
      _$KostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KostResponseToJson(this);
}
