import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/assets_data.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentItemView extends StatefulWidget {
  const PaymentItemView({super.key});
  static final List<String> images = [
    AssetsData.cardImage,
    AssetsData.paypalImage,
    AssetsData.payImage,
  ];

  @override
  State<PaymentItemView> createState() => _PaymentItemViewState();
}

class _PaymentItemViewState extends State<PaymentItemView> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: List.generate(
          PaymentItemView.images.length,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: PaymentItem(
                isActive: currentIndex == index,
                image: PaymentItemView.images[index],
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
