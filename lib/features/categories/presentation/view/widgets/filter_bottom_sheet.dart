import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/presentation/view/categories_screen.dart';
import 'package:flowery/features/categories/presentation/view/widgets/filter_button.dart';
import 'package:flowery/features/categories/presentation/view/widgets/radio_tile.dart';
import 'package:flowery/features/categories/presentation/view/widgets/slider_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatefulWidget {
  final PriceSortOptions selectedOption;
  final double sliderValue;
  final ValueChanged<PriceSortOptions> onSortChanged;
  final ValueChanged<double> onSliderChanged;

  const FilterBottomSheet({
    Key? key,
    required this.selectedOption,
    required this.sliderValue,
    required this.onSortChanged,
    required this.onSliderChanged,
  }) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late PriceSortOptions selectedOptionLocal;
  late double localSliderValue;

  @override
  void initState() {
    super.initState();
    selectedOptionLocal = widget.selectedOption;
    localSliderValue = widget.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        color: const Color.fromRGBO(249, 249, 249, 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sort by",
              style: AppTextStyles.instance.textStyle20.copyWith(
                color: PalletsColors.mainColor60,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.h),
            PriceSortOptionTile(
              label: "Lowest Price",
              value: PriceSortOptions.lowest,
              groupValue: selectedOptionLocal,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedOptionLocal = value;
                  });
                  widget.onSortChanged(value);
                }
              },
            ),
            SizedBox(height: 16.h),
            PriceSortOptionTile(
              label: "Highest Price",
              value: PriceSortOptions.highest,
              groupValue: selectedOptionLocal,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedOptionLocal = value;
                  });
                  widget.onSortChanged(value);
                }
              },
            ),
            SizedBox(height: 16.h),
            Text(
              "Price",
              style: AppTextStyles.instance.textStyle16.copyWith(
                color: PalletsColors.mainColor60,
              ),
            ),
            SizedBox(height: 18.h),
            SliderContainer(), // Replace with your actual slider logic if it uses the value
            SizedBox(height: 16.h),
            FilterButton(),
          ],
        ),
      ),
    );
  }
}
