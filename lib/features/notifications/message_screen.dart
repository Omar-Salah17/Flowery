// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  RemoteMessage message;
  MessageScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LocaleKeys.notification.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title: ${message.notification?.title}"),
            Text("Body: ${message.notification?.body}"),
            Text("Data: ${message.data}"),
            Text("From: ${message.from}"),
          ],
        ),
      ),
    );
  }
}
