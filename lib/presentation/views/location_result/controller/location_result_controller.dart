import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/dormitory_response.dart';
import 'package:kostrushapp/presentation/views/location_result/argument/location_result_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';

class LocationResultController
    extends BaseController<LocationResultArgument, List<DormitoryResponse>> {
  final _repository = Get.find<MainRepository>();

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
    final data =
        await _repository.fetchDormitoryBySunLocality(arguments.locationName);

    data.fold(
      (exception) => emitError(exception.message),
      (result) => emitSuccess(result),
    );
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  void navigateToDetail(String id) {
    Get.toNamed(AppRoutes.detailDormitory);
  }
}
