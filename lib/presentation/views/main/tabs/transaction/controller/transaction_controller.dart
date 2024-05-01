import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../res/routes/app_routes.dart';

class TransactionController extends BaseController<NoArguments, NoState> {
  List<TransactionStatusEnum> transactionStatus = [
    TransactionStatusEnum.pending,
    TransactionStatusEnum.processing,
    TransactionStatusEnum.done,
  ];

  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  void navigateToDetailTransaction() {
    Get.toNamed(AppRoutes.transactionDetail);
  }
}
