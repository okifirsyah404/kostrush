import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
import 'package:kostrushapp/domain/repository/main_repository.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../res/routes/app_routes.dart';
import '../../../../../components/dialog/main_dialog.dart';

class TransactionController
    extends BaseController<NoArguments, List<TransactionResponse>> {
  final _repository = Get.find<MainRepository>();

  List<TransactionStatusEnum> transactionStatus = [
    TransactionStatusEnum.pending,
    TransactionStatusEnum.processing,
    TransactionStatusEnum.done,
  ];

  RxList<TransactionResponse> transactionList = <TransactionResponse>[].obs;

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
    emitLoading();
    final data = await _repository.fetchTransaction();

    data.fold(
      (exception) {
        emitError(exception.message);
        Get.dialog(
          MainDialog.error(
            message: exception.message ?? 'Error',
          ),
        );
      },
      (data) {
        emitSuccess(data);
        transactionList.assignAll(data);
      },
    );
  }

  @override
  void disposeComponent() {
    transactionList.clear();
    transactionList.close();
  }

  void navigateToDetailTransaction() {
    Get.toNamed(AppRoutes.transactionDetail);
  }
}
