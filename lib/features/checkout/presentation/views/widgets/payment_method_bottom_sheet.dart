import 'package:flutter/widgets.dart';
import 'package:payment_app/core/utils/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item_view.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          PaymentItemView(),
          SizedBox(
            height: 30,
          ),
          CustomButton(onTap: (){}, text: "Continue")
        ],
      ),
    );
  }
}