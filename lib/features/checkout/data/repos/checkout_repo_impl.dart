import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_param.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService(apiService: ApiService());
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentParam paymentIntentParam,
  }) async {
    try {
      await stripeService.makePayment(paymentIntentParam: paymentIntentParam);
      return right(null);
    } on StripeException catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.error.message ?? "Oops there was an error",
        ),
      );
    }
  }
}
