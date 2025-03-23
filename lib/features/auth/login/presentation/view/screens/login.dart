import 'package:flowery/core/config/colors.dart';
import 'package:flowery/core/config/custom_text_form_fieled.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormFieled(
                          // textEditingController: "textEditingController",
                          labelText: "labelText",
                          hintText: "hintText",
                        ),
                        SizedBox(height: 44),
                        ElevatedButton(onPressed: () {}, child: Text("data")),
                        SizedBox(height: 44),
                        OutlinedButton(onPressed: () {}, child: Text("data")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
