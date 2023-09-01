import 'package:flutter/material.dart';
import 'package:std_dev_task/features/contact/presentation/pages/add_contact_page.dart';
import 'package:std_dev_task/main.dart';

class STDPageRoute {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    "/": (context) => const MyHomePage(),
    "/add_contact": (context) => AddContactPage()
  };
}
