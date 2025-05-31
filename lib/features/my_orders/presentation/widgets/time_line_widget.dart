import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/my_orders/presentation/track_order.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';

class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({super.key});

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  @override
  void initState() {
    currentStep = 0;
    super.initState();
    startProgress();
  }

  int currentStep = 0;
  /// This function is used to control the progress of the timeline
  /// It runs every 3 seconds and checks if the widget is still mounted
  /// If it is, it increments the currentStep by one and checks if it is at the end
  /// If it is, it resets the currentStep to 0
  void startProgress() async {
    int i = 0;
    while (mounted) {
      await Future.delayed(Duration(seconds: 3));

      setState(() {
        currentStep = i;
      });

      if (i == OrderStatus.Delivered.index) {
        i = 0;
      } else {
        i++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.builder(
      context: context,
      markerCount: OrderStatus.values.length,
      properties: TimelineProperties(
        markerGap: 20,
        iconAlignment: MarkerIconAlignment.center,
        iconSize: 16,
        timelinePosition: TimelinePosition.start,
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
          onTap: () {},
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
