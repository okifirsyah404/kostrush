import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/card/transaction_card.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../../data/enum/transaction_status_enum.dart';
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
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: controller.state?.transaksis?.length ?? 0,
        separatorBuilder: (context, index) => gap(8),
        itemBuilder: (context, index) {
          final transaksi = controller.state?.transaksis?[index];

          logger.d("transaksi: ${transaksi?.namaKost}");

          return TransactionCard(
            name: transaksi?.namaKost ?? "",
            address: transaksi?.namaKamar ?? "",
            price: transaksi?.biaya ?? 0,
            status: transaksi?.statusTransaksi ?? TransactionStatusEnum.pending,
            onTap: () {
              controller.navigateToDetailTransaction(index);
            },
          );
        },
      ),
    );
  }
}
