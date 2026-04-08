import 'package:go_router/go_router.dart';
import 'package:payment_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment_app/features/checkout/presentation/views/payment_details_view.dart';
import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';

abstract class AppRouter {
  static final kPaymentDetailsView = "/PaymenDetailstView";
  static final kThankYouView = "/ThankYouView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => MyCartView()),
      GoRoute(
        path: kPaymentDetailsView,
        builder: (context, state) => PaymentDetailsView(),
      ),
      GoRoute(path: kThankYouView,builder: (context, state) => ThankYouView(),)
    ],
  );
}
