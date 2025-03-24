
import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/email_verification_screen_body.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});
  static const String id = 'EmailVerificationView';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String? email;

  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   log("📥 Received arguments in didChangeDependencies: $args");

  //   if (args is Map<String, dynamic>) {
  //     final receivedEmail = args['email'];
  //     if (receivedEmail != null &&
  //         receivedEmail is String &&
  //         receivedEmail.isNotEmpty) {
  //       setState(() {
  //         email = receivedEmail;
  //       });
  //       print("✅ Email received in EmailVerificationScreen: $email");
  //     } else {
  //       print("❌ Invalid email argument: $receivedEmail");
  //     }
  //   } else {
  //     print("❌ Email argument not found or invalid: $args");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Password'),
        titleSpacing: 0,
      ),
      body: EmailVerificationScreenBody(),
    );
  }
}
