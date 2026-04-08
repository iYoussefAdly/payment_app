import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/functions/build_app_bar.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildConstAppBar(title: "Payment Details"),
      body:PaymentDetailsBody(),
    );
  }
}