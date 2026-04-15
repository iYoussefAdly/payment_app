import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_param.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.checkoutRepo}) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future<void> makePayment({
    required PaymentIntentParam paymentIntentParam,
  }) async {
    emit(PaymentLoading());
    var result = await checkoutRepo.makePayment(
      paymentIntentParam: paymentIntentParam,
    );
    result.fold(
      (failure) {
        emit(PaymentFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        emit(PaymentSuccess());
      },
    );
  }
}
