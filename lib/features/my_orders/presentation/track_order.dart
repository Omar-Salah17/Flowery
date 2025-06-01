import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/enums/order_statu.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/helper_functions/build_app_bar_function.dart';
import 'package:flowery/features/my_orders/presentation/widgets/driver_info.dart';
import 'package:flowery/features/my_orders/presentation/widgets/time_line_widget.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';



String showText(OrderStatus status) {
  switch (status) {
      case OrderStatus.pending:
        return 'Accept';
      case OrderStatus.inProgress:
        return 'Arrived at Pickup Location';
      case OrderStatus.arrivedAtPickup:
        return 'Picked';
      case OrderStatus.picked:
        return 'Start Deliver';
      case OrderStatus.startDeliver:
        return 'Out for Delivery';
      case OrderStatus.outForDelivery:
        return 'Arrived to User';
      case OrderStatus.arrivedToUser:
        return 'Delivered to User';
      case OrderStatus.delivered:
        return 'Delivered';
      default:
        return 'Unknown Status';
  }
}

// ignore: must_be_immutable
class TrackOrderScreen extends StatefulWidget {
  TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {


  var checkIcon = Container(
    width: 20,
    height: 16,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: PalletsColors.mainColorBase,
    ),
    child: Icon(Icons.check, color: Colors.white, size: 12),
  );
  var emptyIcon = Container(
    width: 16,
    height: 16,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: PalletsColors.white70,
    ),
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
              verticalSpace(10),
            TimeLineWidget(),
              verticalSpace(10),
              ElevatedButton(
                onPressed: () {},
                child: Text(LocaleKeys.showMap.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
