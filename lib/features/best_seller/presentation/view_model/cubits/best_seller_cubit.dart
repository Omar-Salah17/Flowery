import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:flowery/features/best_seller/domain/use_case/get_best_seller_use_case.dart';
import 'package:injectable/injectable.dart';

part 'best_seller_state.dart';

@injectable
class BestSellerCubit extends Cubit<BestSellerState> {
  final GetBestSellerUseCase getBestSellerUseCase;

  BestSellerCubit(this.getBestSellerUseCase) : super(BestSellerInitial());

  Future<void> getBestSeller() async {
    emit(BestSellerLoading());
    final result = await getBestSellerUseCase.call();

    result.fold(
      (failure) => emit(BestSellerFailure(errorMessage: failure.errorMessage)),
      (model) => emit(BestSellerSuccess(model: model)),
    );
  }
}
