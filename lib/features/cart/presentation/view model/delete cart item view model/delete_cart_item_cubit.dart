import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:flowery/features/cart/presentation/view%20model/delete%20cart%20item%20view%20model/delete_cart_item_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartItemCubit extends Cubit<DeleteCartItemState> {
  final DeleteCartItemUsecase usecase;

  DeleteCartItemCubit(this.usecase) : super(DeleteCartItemInitial());

  Future<void> deleteCartItem({required String cartItemId}) async {
    emit(DeleteCartItemLoading());

    final result = await usecase.invoke(cartItemId: cartItemId);

    result.fold(
      (failure) =>
          emit(DeleteCartItemFailure(errorMessage: failure.errorMessage)),
      (response) => emit(DeleteCartItemSuccess(response: response)),
    );
  }
}
