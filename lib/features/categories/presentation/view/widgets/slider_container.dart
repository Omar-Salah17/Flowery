import 'dart:developer';

import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({super.key});

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  double minValue = 0;
  double maxValue = 1000;
  RangeValues values = const RangeValues(200, 800);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double startPosition =
            (values.start - minValue) / (maxValue - minValue) * 274.0;
        final double endPosition =
            (values.end - minValue) / (maxValue - minValue) * 314.0;

        log(startPosition.toString());
        log(endPosition.toString());

        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                RangeSlider(
                  min: minValue,
                  max: maxValue,
                  divisions: 1000,
                  values: values,
                  onChanged: (newValues) {
                    setState(() {
                      values = newValues;
                    });
                  },
                  activeColor: PalletsColors.mainColorBase,
                  inactiveColor: const Color.fromRGBO(125, 125, 125, 1),
                ),
                // Custom Labels
                Positioned(
                  left: startPosition + 20, // offset to center the label
                  bottom: -5,
                  child: Text(
                    '\$${values.start.round()}',
                    style: AppTextStyles.instance.textStyle14.copyWith(
                      color: PalletsColors.black50,
                    ),
                  ),
                ),
                Positioned(
                  left: endPosition,
                  bottom: -5,
                  child: Center(
                    child: Text(
                      '\$${values.end.round()}',
                      style: AppTextStyles.instance.textStyle14.copyWith(
                        color: PalletsColors.black50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
