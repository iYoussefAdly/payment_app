import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Total", style: Styles.style24SemiBold),
        Spacer(),
        Text(r"$50.97", style: Styles.style24SemiBold),
      ],
    );
  }
}
