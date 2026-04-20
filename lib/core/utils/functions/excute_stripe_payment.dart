  import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_param.dart';
import 'package:payment_app/features/checkout/presentation/manager/payment_cubit/payment_cubit.dart';

void excuteStripePayment(BuildContext context) {
    PaymentIntentParam paymentIntentParam = PaymentIntentParam(
      amount: "350",
      currency: "USD",
      customerId: 'cus_ULZLkcDFgq29MH',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePayment(paymentIntentParam: paymentIntentParam);
  }