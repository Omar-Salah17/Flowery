// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flowery/core/utils/colors.dart';

class TabWidget extends StatelessWidget {
  
  final TabController? controller;
  List<Widget>tabs ; 
  void Function(int)? onTap;
  TabWidget({
    Key? key,
  
    this.controller,
    required this.tabs,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    
    return TabBar(
      controller: controller,
      onTap: onTap,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelColor: PalletsColors.mainColorBase,
      unselectedLabelColor: PalletsColors.white70,
      indicatorColor: PalletsColors.mainColorBase,
      labelStyle: text.labelMedium,
      tabs: tabs,
    );
  }
}
