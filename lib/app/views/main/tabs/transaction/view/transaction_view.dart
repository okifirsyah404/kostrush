import 'package:flutter/material.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../components/appbar/default_appbar.dart';
import '../controller/transaction_controller.dart';

class TransactionView extends BaseView<TransactionController> {
  const TransactionView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Transaksi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container();
  }
}
