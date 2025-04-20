import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_item.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/features/cart/presentation/view/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {

  final CartItem cartItem;
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
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
                height: 100.h,
                width: 80.w,
                fit: BoxFit.cover,
                imageUrl: cartItem.product?.imgCover ?? '',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: PalletsColors.mainColorBase,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.product?.title ?? "No Title",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.instance.textStyle16.copyWith(
                                color: PalletsColors.blackBase,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              cartItem.product?.description ?? "No desc",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.instance.textStyle13.copyWith(
                                color: PalletsColors.white90,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().deleteCartItem(cartItem.product!.id!);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Image.asset(
                            "assets/images/delete.png",
                            height: 20.h,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        'EGP ${cartItem.product?.price}' ,
                        style: AppTextStyles.instance.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: PalletsColors.blackBase,
                        ),
                      ),

                      QuantitySelector(
                        initialValue: cartItem.quantity ?? 1,
                        id: cartItem.product!.id!,
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}
