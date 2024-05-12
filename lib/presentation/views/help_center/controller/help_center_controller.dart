import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class HelpCenterController extends BaseController<NoArguments, NoState> {
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

  void intentToInstagram() async {}

  void intentToWhatsapp() async {
    final Uri uri = Uri(
      scheme: 'https',
      path: 'wa.me/6281913236990',
    );

    if (!await launchUrl(uri)) {
      final Uri uri = Uri(
        scheme: 'https',
        path: 'api.whatsapp.com/send',
        queryParameters: {
          'phone': '6281913236990',
        },
      );
      await launchUrl(uri);
    }
  }

  void intentToMaps() {}
}
