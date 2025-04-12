import 'package:bloc/bloc.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/domain/useCases/get_product_details_use_case.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.getProductDetailsUseCase)
    : super(ProductDetailsInitial());
  final GetProductDetailsUseCase getProductDetailsUseCase;
  fetchProduct(String productId) async {
    emit(ProductDetailsLoading());
    var result = await getProductDetailsUseCase.GetProductDetails(productId);
    result.fold(
      (failure) {
        print(failure.errorMessage);
        emit(ProductDetailsError(message: failure.errorMessage));
      },
      (responce) {
        print(responce);
        emit(ProductDetailsSuccess(product: responce));
      },
    );
  }
}
