import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/functions/build_app_bar.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildConstAppBar(title: 'My Cart'), body: MyCartViewBody());
  }
}
