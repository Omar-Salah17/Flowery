
import 'package:bloc/bloc.dart';
import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_states.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ApiService apiService;

  ProductDetailsCubit({required this.apiService}) : super(ProductDetailsInitial());

  void fetchProduct(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product = await apiService.getProductDetails(productId);
      emit(ProductDetailsLoaded(product: product));
    } catch (e) {
      emit(ProductDetailsError(message: e.toString()));
    }
  }
}




