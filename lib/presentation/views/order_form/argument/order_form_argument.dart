import 'package:kostrushapp/base/base_argument.dart';

class OrderFormArgument extends BaseArguments {
  final int kostId;
  final int roomId;

  OrderFormArgument({
    required this.kostId,
    required this.roomId,
  });
}
