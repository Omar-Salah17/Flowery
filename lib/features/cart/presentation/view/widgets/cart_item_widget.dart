import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/cart/presentation/view/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
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
              child: Image.asset(
                item['image'],
                width: 90.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    item['title'],
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
                    item['subtitle'],
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.instance.textStyle13.copyWith(
                      color: PalletsColors.white90,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  item['price'],
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
                  onTap: onDelete,
                  child: Image.asset("assets/images/delete.png"),
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
