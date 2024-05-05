import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/transaction_response.dart';
import 'package:kostrushapp/presentation/views/detail_transaction/arguments/detail_transaction_arguments.dart';
import 'package:kostrushapp/utils/extensions/date_time_ext.dart';

import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';
import '../../../components/dialog/main_dialog.dart';
import '../../../components/focus_node/no_focus_node.dart';

class DetailTransactionController
    extends BaseController<DetailTransactionArguments, TransactionResponse> {
  final _repository = Get.find<MainRepository>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController occupationController;
  late TextEditingController roomTypeController;
  late TextEditingController dateController;
  late TextEditingController durationController;

  late NoFocusNode noFocusNode;

  @override
  void initComponent() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    occupationController = TextEditingController();
    roomTypeController = TextEditingController();
    dateController = TextEditingController();
    durationController = TextEditingController();
    noFocusNode = NoFocusNode();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();

    final data =
        await _repository.fetchTransactionDetail(arguments.transactionId);

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
        roomTypeController.text = data.dormitory.dormitoryType;
        dateController.text = data.transactionTime.checkIn.formatDate();
        durationController.text = data.transactionTime.durationMonth.toString();
      },
    );

    final profileData = await _repository.fetchProfile();

    profileData.fold(
      (exception) {
        emitError(exception.message);
        Get.dialog(
          MainDialog.error(
            message: exception.message ?? 'Error',
          ),
        );
      },
      (data) {
        nameController.text = data.profile.name;
        phoneController.text = data.profile.phoneNumber ?? '';
        occupationController.text = data.profile.occupation ?? '';
      },
    );
  }

  @override
  void disposeComponent() {
    nameController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    roomTypeController.dispose();
    dateController.dispose();
    durationController.dispose();
    noFocusNode.dispose();
  }
}
