import 'package:kostrushapp/data/network/response/kost_response.dart';

class DashboardModel {
  final KostResponse recommendedKost;
  final KostResponse cheapKost;

  DashboardModel({
    required this.recommendedKost,
    required this.cheapKost,
  });
}
