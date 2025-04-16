import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';

import 'package:flowery/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:flowery/features/cart/presentation/view%20model/add_to_cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartUsecase) : super(AddToCartInitial());

  final AddToCartUsecase addToCartUsecase;
static AddToCartUsecase get(context) => BlocProvider.of(context);
  Future<void> addToCart({required AddProductRequest addProductRequest}) async {
    emit(AddToCartLoading());
    log("AddToCartCubit: before invoke");

    final result = await addToCartUsecase.invoke(
      addProductRequest: addProductRequest,
    );

    log("AddToCartCubit: after invoke");
    result.fold(
      (failure) {
        log("AddToCartCubit: failure - ${failure.errorMessage}");
        emit(AddToCartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        log("AddToCartCubit: success");
        emit(AddToCartSuccess(response: response));
      },
    );
  }
}
