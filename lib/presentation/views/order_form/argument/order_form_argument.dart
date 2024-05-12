import 'package:kostrushapp/base/base_argument.dart';

class OrderFormArgument extends BaseArguments {
  final String kostId;
  final String kostName;
  final String roomId;
  final int price;

  OrderFormArgument({
    required this.kostId,
    required this.kostName,
    required this.roomId,
    required this.price,
  });
}
