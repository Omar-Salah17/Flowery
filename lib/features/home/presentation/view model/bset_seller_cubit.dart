import 'package:flowery/features/home/domain/use_case/best_seller_usecase.dart';
import 'package:flowery/features/home/presentation/view%20model/best_seller_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.getBestSellersUseCase) : super(BestSellerInitial());

  final Bestsellerusecase getBestSellersUseCase;

  Future<void> getBestSellersData() async {
    emit(BestSellerLoading());
    final result = await getBestSellersUseCase.invoke();

    result.fold(
      (failure) => emit(BestSellerFailure(failure.errorMessage)),
      (bestSellers) => emit(BestSellerSuccess(bestSellers: bestSellers)),
    );
  }
}
