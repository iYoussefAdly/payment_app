import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/assets_data.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomCreditCardItem extends StatelessWidget {
  const CustomCreditCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logoImage),
          SizedBox(width: 23),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Credit Card\n", style: Styles.style18Regular),
                TextSpan(
                  text: "Mastercard **78",
                  style: Styles.style18Regular.copyWith(
                    color: Color(0xff4A4A4A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
