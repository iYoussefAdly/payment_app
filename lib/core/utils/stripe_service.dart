import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_param.dart';

class StripeService {
  final ApiService apiService;
  StripeService({required this.apiService});
  final String url = "https://api.stripe.com/v1/payment_intents";
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentParam paymentIntentParam,
  }) async {
    var response = await apiService.post(
      url: url,
      body: paymentIntentParam.toJson(),
      token: ApiKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(
      response.data,
    );
    return paymentIntentModel;
  }
}
