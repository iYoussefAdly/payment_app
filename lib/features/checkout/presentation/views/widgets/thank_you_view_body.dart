import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_dashd_line.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 27),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(
            right: 20 + 10,
            left: 20 + 10,
            bottom: MediaQuery.of(context).size.height * 0.15 + 20,
            child: CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * 0.15,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * 0.15,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(top: -50, right: 0, left: 0, child: CustomCheckIcon()),
        ],
      ),
    );
  }
}
