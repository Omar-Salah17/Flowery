import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/domain/usecases/update_product_quantity_repo.dart';
import 'package:flowery/features/cart/presentation/view%20model/update%20product%20quantity%20view%20model/update_product_quantity_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  final UpdateCartItemUseCase updateCartItemUseCase;

  UpdateCartCubit(this.updateCartItemUseCase) : super(UpdateCartInitial());

  Future<void> updateCartItem({
    required String cartItemId,
    required String token,
    required UpdateProductRequest request,
  }) async {
    emit(UpdateCartLoading());

    final result = await updateCartItemUseCase(
      cartItemId: cartItemId,
      token: token,
      request: request,
    );

    result.fold(
      (error) => emit(UpdateCartFailure(error)),
      (response) => emit(UpdateCartSuccess(response)),
    );
  }
}
