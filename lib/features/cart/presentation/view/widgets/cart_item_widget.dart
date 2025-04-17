import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_item.dart';

import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quantity_selector.dart';

class CartItemWidget extends StatelessWidget {
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;

  final String id;
  final CartItem cartItem;
  const CartItemWidget({
    super.key,

    required this.onDelete,
    required this.onQuantityChanged,

    required this.id, required this.cartItem,
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
                imageUrl: cartItem.product?.imgCover??'',
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
                    cartItem.product?.title ?? "No Title",
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
                    cartItem.product?.description?? "No desc",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.instance.textStyle13.copyWith(
                      color: PalletsColors.white90,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  cartItem.product?.price.toString() ?? '0',
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
                GestureDetector(
                      onTap: () {
                      
                       
                      },
                      child: Image.asset("assets/images/delete.png"),
                    ),
                const Spacer(),
                QuantitySelector(
                  initialValue: 1,
                  id: id,
                  onChanged: onQuantityChanged,
                  updateCartCubit: updateCartCubit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
