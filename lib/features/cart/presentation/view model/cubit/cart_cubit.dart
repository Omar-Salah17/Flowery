import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/get_user_cart_usecase.dart';
import 'package:flowery/features/cart/domain/usecases/update_product_quantity_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
    this.addToCartUsecase,
    this.updateProductQuantityUseCase,
    this.getUserCartUsecase,
    this.deleteCartItemUsecase,
    this.clearCartUsecase,
  ) : super(CartInitial());
  final AddToCartUsecase addToCartUsecase;
  final UpdateProductQuantityUseCase updateProductQuantityUseCase;
  final GetUserCartUsecase getUserCartUsecase;
  final DeleteCartItemUsecase deleteCartItemUsecase;

  final ClearCartUsecase clearCartUsecase;
  Future<void> addToCart(AddProductRequest addProductRequest) async {
    emit(CartLoading());
    final result = await addToCartUsecase.invoke(
      addProductRequest: addProductRequest,
    );
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        emit(CartSuccess(cartResponse: response));
      },
    );
  }

  Future<void> getUserCart() async {
    emit(CartLoading());
    final result = await getUserCartUsecase.invoke();
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        emit(CartSuccess(cartResponse: response));
      },
    );
  }

  Future<void> clearCart() async {
    emit(CartLoading());
    final result = await clearCartUsecase.invoke();
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        emit(CartSuccess(cartResponse: response));
      },
    );
  }

  Future<void> deleteCartItem(String cartItemId) async {
    emit(CartLoading());
    final result = await deleteCartItemUsecase.invoke(cartItemId: cartItemId);
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        emit(CartSuccess(cartResponse: response));
      },
    );
  }

  Future<void> updateProductQuantity(
    String cartItemId,
    int productQuantity,
  ) async {
    emit(CartLoading());
    final result = await updateProductQuantityUseCase.call(
      cartItemId: cartItemId,
      productQuantity: productQuantity,
    );
    result.fold(
      (failure) {
        emit(CartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        emit(CartSuccess(cartResponse: response));
      },
    );
  }
}
