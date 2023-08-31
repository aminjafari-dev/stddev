import 'package:flutter/material.dart';
import 'package:std_dev_task/features/contact/presentation/pages/add_contact_page.dart';
import 'package:std_dev_task/features/contact/presentation/pages/cantacts_page.dart';
import 'package:std_dev_task/main.dart';

class AppPageRoute {
  static Map<String, Widget Function(BuildContext)> routes =
       <String, WidgetBuilder>{
        "/":(context) => const MyHomePage(),
        // "/":(context) => const ContactsPage(),
        "add_contact":(context) =>  AddContactPage()
      };
}
