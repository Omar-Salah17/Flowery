import 'dart:developer';

import 'package:flowery/core/enums/order_statu.dart';
import 'package:flowery/core/provider/app_config_provider.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/my_orders/presentation/track_order.dart';
import 'package:flowery/features/my_orders/presentation/view/driver_firebase_service%20.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_list/timeline_list.dart';

class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({super.key});

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
   static const String orderId = "681bd6741433a666c8da31c7";
int currentStep = 0;

@override
void initState() {
  super.initState();
  getStatusUpdates();
}
void getStatusUpdates() {
  DriverFirebaseService.firestore
      .collection('orders')
      .doc(orderId)
      .snapshots()
      .listen((docSnapshot) {
    if (docSnapshot.exists) {
      final status = docSnapshot.data()?['order']?['state'];
      log('Status updated: $status');
      if (status != null) {
        final index = convertStatusToIndex(status.toString());
        // if (index != -1 && mounted) {
          setState(() {
            currentStep = index -1;
          });
        // }
      }
    }
  });
}
int convertStatusToIndex(String status) {
  return OrderStatus.values.indexWhere((e) => e.name == status);
}

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Timeline.builder(
physics: const NeverScrollableScrollPhysics(),
      context: context,
      markerCount: OrderStatus.values.length,
      properties: TimelineProperties(
        markerGap: 40,
        lineColor: PalletsColors.mainColorBase,
        
        iconAlignment: MarkerIconAlignment.center,
        iconSize: 16,
        timelinePosition:   TimelinePosition.start,
      ),
      markerBuilder: (context, index) {
        final isCompleted = index < currentStep;
        final isCurrent = index == currentStep;
        final icon =
            isCompleted || isCurrent
                ? Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PalletsColors.mainColorBase,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 12),
                )
                : Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PalletsColors.gray,
                  ),
                );
        return Marker(
      
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showText(OrderStatus.values[index]),
                  style: AppTextStyles.instance.textStyle14.copyWith(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color:
                        isCompleted || isCurrent
                            ? PalletsColors.mainColorBase
                            : Colors.black,
                  ),
                ),
                Text(
                  '03 Sep 2024, 11:00 AM',
                  style: AppTextStyles.instance.textStyle11.copyWith(
                    fontWeight: FontWeight.w300,
                    color: PalletsColors.gray,
                  ),
                ),
              ],
          ),
            ),
          icon: icon,
          position: MarkerPosition.left,
        );
      },
    );
  }
}


