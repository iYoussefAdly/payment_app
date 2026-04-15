import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/utils/simple_bloc_observer.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishedKey;
  runApp(const CheckoutApp());
  Bloc.observer = SimpleBlocObserver();
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
    );
  }
}
