import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/order_info_item.dart';

class OrderInfoItemView extends StatelessWidget {
  const OrderInfoItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        OrderInfoItem(title: "Order Subtotal", price: "42.97"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: OrderInfoItem(title: "Discount", price: "0"),
        ),
        OrderInfoItem(title: "Shipping", price: "8")
      ],
    );
  }
}