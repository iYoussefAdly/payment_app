import 'package:flutter/widgets.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item_info.dart';

class PaymentItemInfoView extends StatelessWidget {
  const PaymentItemInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentItemInfo(title: "Date", value: "01/24/2023"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: PaymentItemInfo(title: "Time", value: "10:15 AM"),
        ),
        PaymentItemInfo(title: "To", value: "Sam Louis"),
      ],
    );
  }
}