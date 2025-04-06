import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  bool isSelected = true;
  TabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    return TabBar(
      
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelColor: PalletsColors.mainColorBase,
      unselectedLabelColor: PalletsColors.white70,
    indicatorColor: PalletsColors.mainColorBase,
      labelStyle: text.labelMedium,
      tabs: [
        Tab(text: 'Wedding'),
        Tab(text: 'Graduation'),
        Tab(text: 'Birthday'),
        Tab(text: 'Katb Ketab'),
        Tab(text: 'Wedding'),
        Tab(text: 'Graduation'),
        Tab(text: 'Birthday'),
        Tab(text: 'Katb Ketab'),
      ],
    );
  }
}
