import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/functions/build_app_bar.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildConstAppBar(),
      body: Transform.translate(
        offset: Offset(0, -16),
        child: ThankYouViewBody(),
      ),
    );
  }
}
