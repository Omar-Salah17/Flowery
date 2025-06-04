// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/my_orders/presentation/view/driver_firebase_service%20.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverInfo extends StatefulWidget {
  DriverInfo({Key? key}) : super(key: key);
  static const String orderId = "681bd6741433a666c8da31c7";

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
  initState() {
    getDriverInfo();
    super.initState();
  }

  String driverName = "";
  getDriverInfo() {
    var data =
        DriverFirebaseService.firestore
            .collection('orders')
            .doc(DriverInfo.orderId)
            .get();
    data.then((value) {
      setState(() {
        driverName = value.data()?['driver']?['firstName'];
        log('driverName $driverName');
      });
    });
  }

  Future<void> launchCustomUrl(BuildContext context, String? url) async {
    if (url != null) {
      final Uri newUrl = Uri.parse(url);
      if (await canLaunchUrl(newUrl)) {
        await launchUrl(newUrl);
      } else {
        showSnackBar(context, 'Cannot launch $url');
      }
    }
  }

  String phoneNumber = "tel:+201090096246";
  String whatsAppUrl = "https://wa.me/201090096246";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/Delivery Boy.png"),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(driverName, style: AppTextStyles.instance.textStyle16),
            Text(
              "Is your delivery hero for today",
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: PalletsColors.gray,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () async {
            await launchCustomUrl(context, phoneNumber);
          },
          icon: const Icon(Icons.call),
          color: PalletsColors.mainColorBase,
        ),
        IconButton(
          onPressed: () async {
            await launchCustomUrl(context, whatsAppUrl);
          },
          icon: SvgPicture.asset(
            height: 20,
            width: 20,
            "assets/images/whatsapp.svg",
          ),
          color: PalletsColors.mainColorBase,
        ),
      ],
    );
  }
}
