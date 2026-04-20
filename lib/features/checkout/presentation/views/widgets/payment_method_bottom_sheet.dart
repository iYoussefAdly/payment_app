import 'package:flutter/widgets.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item_view.dart';

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  updatePaymentMethod({required int index}) {
    if (index == 1) {
      setState(() {
      isPayPal = true;
      });
    } else {
      setState(() {
      isPayPal = false;
      });
    }
  }

  bool isPayPal = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          PaymentItemView(updatePaymentMethod: updatePaymentMethod,),
          SizedBox(height: 30),
          CustomButtonBlocConsumer(isPaypal: isPayPal),
        ],
      ),
    );
  }
}
