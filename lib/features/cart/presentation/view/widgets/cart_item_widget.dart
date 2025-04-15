import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';
import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:flowery/features/cart/presentation/view%20model/delete%20cart%20item%20view%20model/delete_cart_item_cubit.dart';
import 'package:flowery/features/cart/presentation/view%20model/delete%20cart%20item%20view%20model/delete_cart_item_states.dart';
import 'package:flowery/features/cart/presentation/view/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color.fromRGBO(83, 83, 83, 1),
          width: 0.5.sp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                height: 160.h,
                width: 95.w,
                fit: BoxFit.contain,
                imageUrl: item.product.imgCover,
                progressIndicatorBuilder:
                    (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        color: PalletsColors.mainColorBase,
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    item.product.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.instance.textStyle16.copyWith(
                      color: PalletsColors.blackBase,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    item.product.description,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.instance.textStyle13.copyWith(
                      color: PalletsColors.white90,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  item.product.price.toString(),
                  style: AppTextStyles.instance.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: PalletsColors.blackBase,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocProvider(
                  create:
                      (context) => DeleteCartItemCubit(
                        getIt.get<DeleteCartItemUsecase>(),
                      ),

                  child: BlocConsumer<DeleteCartItemCubit, DeleteCartItemState>(
                    listener: (context, state) {
                      if (state is DeleteCartItemFailure) {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      } else if (state is DeleteCartItemSuccess) {
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Item deleted successfully!")),
                        );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<DeleteCartItemCubit>().deleteCartItem(
                            cartItemId: item.id,
                          );
                        },
                        child: Image.asset("assets/images/delete.png"),
                      );
                    },
                  ),
                ),
                const Spacer(),
                QuantitySelector(initialValue: 1, onChanged: onQuantityChanged),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
