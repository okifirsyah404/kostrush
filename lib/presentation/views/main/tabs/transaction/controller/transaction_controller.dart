import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../domain/repository/main_repository.dart';
import '../../../../../../res/routes/app_routes.dart';
import '../../../../detail_transaction/argument/detail_transaction_argument.dart';

class TransactionController
    extends BaseController<NoArguments, TransactionResponse> {
  final _repository = Get.find<MainRepository>();

  late ProfileModel profile;

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
    final result = await _repository.getTransaction();

    final profileResult = await _repository.getProfile();

    result.fold(
      (error) {
        emitError(error.toString());
      },
      (data) {
        emitSuccess(data);
      },
    );

    profileResult.fold(
      (error) {
        emitError(error.toString());
      },
      (data) {
        profile = data;
      },
    );
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  void navigateToDetailTransaction(int index) {
    Get.toNamed(
      AppRoutes.transactionDetail,
      arguments: DetailTransactionArgument(
        profile: profile,
        transaction: state!.transaksis![index],
      ),
    );
  }
}
