import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/views/detail_transaction/argument/detail_transaction_argument.dart';
import 'package:kostrushapp/utils/extensions/date_time_ext.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../components/focus_node/no_focus_node.dart';

class DetailTransactionController
    extends BaseController<DetailTransactionArgument, NoState> {
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

    nameController.text = arguments.profile.name ?? "";
    phoneController.text = arguments.profile.phoneNumber ?? "";
    occupationController.text = arguments.profile.occupation ?? "";
    roomTypeController.text = "Regular";
    dateController.text =
        arguments.transaction.tanggalMasuk?.formatDate() ?? "";
    durationController.text = "1";
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
    nameController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    roomTypeController.dispose();
    dateController.dispose();
    durationController.dispose();
    noFocusNode.dispose();
  }
}
