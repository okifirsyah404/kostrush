import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/model/profile_model.dart';

import '../../../../data/network/response/transaction_response.dart';

class DetailTransactionArgument extends BaseArguments {
  final ProfileModel profile;
  final Transaction transaction;

  DetailTransactionArgument({
    required this.profile,
    required this.transaction,
  });
}
