class InitPaymentSheetParam {
  final String clientSecret;
  final String ephemeralKey;
  final String customerId;
  InitPaymentSheetParam({
    required this.clientSecret,
    required this.ephemeralKey,
    required this.customerId,
  });
}
