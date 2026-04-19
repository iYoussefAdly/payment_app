import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/utils/functions/show_snack_bar.dart';
import 'package:payment_app/core/utils/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_app/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment_app/features/checkout/presentation/manager/payment_cubit/payment_cubit.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

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
            // PaymentIntentParam paymentIntentParam = PaymentIntentParam(
            //   amount: "350",
            //   currency: "USD",
            //   customerId: 'cus_ULZLkcDFgq29MH',
            // );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentIntentParam: paymentIntentParam);
            var transactionsData = getTransactions();
            excutePayment(context, transactionsData);
          },
          text: "Continue",
        );
      },
    );
  }

  void excutePayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.secretPaypalId,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactions() {
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(shipping: "0", subtotal: "100", shippingDiscount: 0),
    );
    List<Item> items = [
      Item(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      Item(name: "Apple", quantity: 6, price: "10", currency: "USD"),
    ];
    var itemList = ItemListModel(items: items);
    return (amount: amount, itemList: itemList);
  }
}
