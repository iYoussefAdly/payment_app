import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/assets_data.dart';
import 'package:payment_app/core/utils/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/order_info_item_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset(AssetsData.basketImage),
            ),
          ),
          SizedBox(height: 25),
          OrderInfoItemView(),
          Divider(
            height: 32,
            endIndent: 15,
            indent: 15,
            thickness: 2,
            color: Color(0xffBFBFBF),
          ),
          TotalPrice(),
          SizedBox(height: 16),
          CustomButton(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                context: context,
                builder: (context) => PaymentMethodBottomSheet(),
              );
            },
            text: "Complete Payment",
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
