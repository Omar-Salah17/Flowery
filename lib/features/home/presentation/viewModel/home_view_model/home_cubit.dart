import 'package:bloc/bloc.dart';
import 'package:flowery/core/enums/request_enum.dart';
import 'package:flowery/features/best_seller/domain/use_case/get_best_seller_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/home/presentation/viewModel/home_view_model/home_state.dart';
import 'package:flowery/features/occasion/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllCategoriesUseCase getCategories;
  final GetBestSellerUseCase getBestSeller;
  final GetAllOccasionsUseCase getOccasions;

  HomeCubit({
    required this.getCategories,
    required this.getBestSeller,
    required this.getOccasions,
  }) : super(const HomeState());

  Future<void> fetchCategories() async {
    emit(state.copyWith(categoriesState: RequestState.loading));
    final result = await getCategories();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            categoriesState: RequestState.error,
            error: failure.toString(),
          ),
        );
      },
      (cats) {
        emit(
          state.copyWith(
            categoriesState: RequestState.success,
            categories: cats,
          ),
        );
      },
    );
  }

  Future<void> fetchBestSeller() async {
    emit(state.copyWith(bestSellerState: RequestState.loading));
    final result = await getBestSeller(); //

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            bestSellerState: RequestState.error,
            error: failure.toString(),
          ),
        );
      },
      (bestSellers) {
        emit(
          state.copyWith(
            bestSellerState: RequestState.success,
            bestSellers: bestSellers.bestSeller,
          ),
        );
      },
    );
  }

  Future<void> fetchOccasions() async {
    emit(state.copyWith(occasionState: RequestState.loading));
    final result = await getOccasions.invoke();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            occasionState: RequestState.error,
            error: failure.toString(),
          ),
        );
      },
      (occasions) {
        emit(
          state.copyWith(
            occasionState: RequestState.success,
            occasions: occasions,
          ),
        );
      },
    );
  }
}
