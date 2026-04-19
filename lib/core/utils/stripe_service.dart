import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/checkout/data/models/customer_object_model/customer_object/customer_object.dart';
import 'package:payment_app/features/checkout/data/models/customer_object_param.dart';
import 'package:payment_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_app/features/checkout/data/models/init_payment_sheet_param.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_param.dart';

class StripeService {
  final ApiService apiService;
  StripeService({required this.apiService});
  final String ephemeralKey = "https://api.stripe.com/v1/ephemeral_keys";
  final String createPaymentIntenturl =
      "https://api.stripe.com/v1/payment_intents";
  final String createCustomerUrl = "https://api.stripe.com/v1/customers";
  final String ephemeralKeyUrl = "https://api.stripe.com/v1/ephemeral_keys";
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentParam paymentIntentParam,
  }) async {
    var response = await apiService.post(
      url: createPaymentIntenturl,
      body: paymentIntentParam.toJson(),
      token: ApiKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(
      response.data,
    );
    return paymentIntentModel;
  }

  Future<CustomerObject> createCustomer({
    required CustomerObjectParam customerObjectParam,
  }) async {
    var response = await apiService.post(
      url: createCustomerUrl,
      body: customerObjectParam.toJson(),
      token: ApiKeys.secretKey,
    );
    CustomerObject customerObject = CustomerObject.fromJson(response.data);
    return customerObject;
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      url: ephemeralKeyUrl,
      body: {"customer": customerId},
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2026-03-25.dahlia",
      },
    );
    EphemeralKeyModel ephemeralKeyModel = EphemeralKeyModel.fromJson(
      response.data,
    );
    return ephemeralKeyModel;
  }

  Future initPaymentSheet({
    required InitPaymentSheetParam initPaymentSheetParam,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetParam.clientSecret,
        merchantDisplayName: "Youssef",
        customerId: initPaymentSheetParam.customerId,
        customerEphemeralKeySecret: initPaymentSheetParam.ephemeralKey,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentParam paymentIntentParam}) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentParam: paymentIntentParam,
    );
    var ephemeralKey = await createEphemeralKey(
      customerId: paymentIntentParam.customerId,
    );
    var paymentSheetparams = InitPaymentSheetParam(
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKey: ephemeralKey.secret!,
      customerId: paymentIntentParam.customerId,
    );
    await initPaymentSheet(initPaymentSheetParam: paymentSheetparams);
    await displayPaymentSheet();
  }
}
