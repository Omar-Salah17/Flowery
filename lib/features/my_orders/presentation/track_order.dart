import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/helper_functions/build_app_bar_function.dart';
import 'package:flowery/features/my_orders/presentation/widgets/driver_info.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

// ignore: must_be_immutable
class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({super.key});
  StepProgressController stepProgressController = StepProgressController(
    totalSteps: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: LocaleKeys.trackOrder.tr(),
        onPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.estimatedArrival.tr(),
                style: AppTextStyles.instance.textStyle14.copyWith(
                  color: PalletsColors.gray,
                ),
              ),
              Text(
                '03 Sep 2024, 11:00 AM',
                style: AppTextStyles.instance.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(10),
              Divider(color: PalletsColors.white70),
              verticalSpace(20),
              DriverInfo(),
              verticalSpace(40),
              Center(child: Image.asset('assets/images/Car.png')),
              // verticalSpace(10),
              StepProgress(
                totalSteps: 4,
                currentStep: 2,
                stepSize: 25,
                // margin: EdgeInsets.all( 8.0),
                controller: stepProgressController,
                axis: Axis.vertical,
                height: 400,
                nodeTitles: const [
                  'Received your order',
                  'Step 2',
                  'Step 3',
                  'Step 4',
                ],
                padding: const EdgeInsets.all(18),
                theme: const StepProgressThemeData(
                  rippleEffectStyle: RippleEffectStyle(
                    borderColor: PalletsColors.mainColorBase,
                  ),
                  activeForegroundColor: PalletsColors.mainColorBase,
                  stepAnimationDuration: Duration(milliseconds: 500),
                  // lineLabelAlignment: Alignment.center,
                  nodeLabelStyle: StepLabelStyle(
                    // labelAxisAlignment: CrossAxisAlignment.start,
                    activeColor: PalletsColors.mainColorBase,
                  ),
                  stepLineSpacing: 10,
                  stepLineStyle: StepLineStyle(borderRadius: Radius.circular(4)),
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text(
                LocaleKeys.showMap.tr()
              ))
            ],
          ),
        ),
      ),
    );
  }
}
