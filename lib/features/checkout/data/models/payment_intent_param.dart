class PaymentIntentParam {
  final String amount;
  final String currency;
  PaymentIntentParam({required this.amount, required this.currency});
  toJson(){
    return {
      "amount":amount,
      "currency":currency
    };
  }
}
