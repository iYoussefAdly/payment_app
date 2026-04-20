import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/utils/functions/get_transactions.dart';
import 'package:payment_app/core/utils/functions/show_snack_bar.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/item_list_model/item_list_model.dart';

void excutePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData,
  ) {
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
            GoRouter.of(context).pushReplacement(AppRouter.kThankYouView);
          },
          onError: (error) {
            log("onError: $error");
            GoRouter.of(context).canPop();
            showSnackBar(context, error.toString());
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
  void excutePayPal(BuildContext context) {
    var transactionsData = getTransactions();
    excutePaypalPayment(context, transactionsData);
  }