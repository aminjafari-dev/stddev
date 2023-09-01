import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:std_dev_task/core/widgets/app_bar.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/std_text_field.dart';
import 'package:std_dev_task/features/contact/presentation/widgets/text_field_validation.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar.appBar("Login & Register"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          StdTextField(
            controller: _emailCont,
            hintText: "Email",
            validator: (v) {
              return v!.emailValidation;
            },
          ),
          STDSizedBox.height_12,
          StdTextField(
            controller: _passCont,
            hintText: "Email",
            validator: (v) {
              return v!.passValidation(v);
            },
          ),
          STDSizedBox.height_30,
          OutlinedButton(onPressed: () {}, child: Text("login & Register")),
        ],
      ),
    );
  }
}
