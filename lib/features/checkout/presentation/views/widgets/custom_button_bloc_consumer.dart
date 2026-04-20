import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/utils/functions/excute_paypal_payment.dart';
import 'package:payment_app/core/utils/functions/excute_stripe_payment.dart';
import 'package:payment_app/core/utils/functions/show_snack_bar.dart';
import 'package:payment_app/core/utils/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/manager/payment_cubit/payment_cubit.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kThankYouView);
        }
        if (state is PaymentFailure) {
          GoRouter.of(context).pop();
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {
            isPaypal ? excutePayPal(context) : excuteStripePayment(context);
          },
          text: "Continue",
        );
      },
    );
  }
}
