import 'package:flutter/cupertino.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';

import '../../../../../../base/base_controller.dart';

class DashboardController extends BaseController<NoArguments, NoState> {
  late TextEditingController searchController;

  @override
  void initComponent() {
    searchController = TextEditingController();
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
    searchController.dispose();
  }
}
