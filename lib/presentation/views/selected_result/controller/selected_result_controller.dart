import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/presentation/views/selected_result/argument/selected_result_argument.dart';

import '../../../../base/base_controller.dart';

class SelectedResultController
    extends BaseController<SelectedResultArgument, NoState> {
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

  String get title {
    switch (arguments.context) {
      case SelectedResultContext.popularDormitory:
        return "Kost Populer";
      case SelectedResultContext.cheapDormitory:
        return "Kost Termurah";
    }
  }
}
