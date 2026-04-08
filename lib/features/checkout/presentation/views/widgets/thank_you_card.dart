import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_credit_card_item.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item_info_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffE4E4E4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66, left: 22, right: 22),
        child: Column(
          children: [
            Text("Thank you!", style: Styles.style25Medium),
            FittedBox(
              child: Text(
                "Your transaction was successful",
                style: Styles.style20Regular,
              ),
            ),
            SizedBox(height: 42),
            PaymentItemInfoView(),
            Divider(height: 60, color: Color(0xffBFBFBF), thickness: 2),
            TotalPrice(),
            SizedBox(height: 30),
            CustomCreditCardItem(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode.data, size: 64),
                Container(
                  width: 113,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 1.50, color: Color(0xff32A150)),
                  ),
                  child: Center(
                    child: Text(
                      "PAID",
                      style: Styles.style24SemiBold.copyWith(
                        color: Color(0xff32A150),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:
                  ((MediaQuery.of(context).size.height * 0.15 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
