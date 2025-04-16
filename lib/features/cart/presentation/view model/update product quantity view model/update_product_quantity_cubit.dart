import 'dart:developer';

import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/domain/usecases/update_product_quantity_repo.dart';
import 'package:flowery/features/cart/presentation/view%20model/update%20product%20quantity%20view%20model/update_product_quantity_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  final UpdateCartItemUseCase updateCartItemUseCase;

  UpdateCartCubit(this.updateCartItemUseCase) : super(UpdateCartInitial());
  static UpdateCartCubit get(context) => BlocProvider.of(context);
  Future<void> updateCartItem({
    required String cartItemId,

    required UpdateProductRequest request,
  }) async {
    emit(UpdateCartLoading());
    log(cartItemId);
    log(request.quantity.toString());
    final result = await updateCartItemUseCase(
      cartItemId: cartItemId,
      request: request,
    );

    result.fold(
      (failure) => emit(UpdateCartFailure(failure.errorMessage)),
      (response) => emit(UpdateCartSuccess(response)),
    );
  }
}
