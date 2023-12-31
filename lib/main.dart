import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:std_dev_task/core/dependency/dependency_injection.dart';
import 'package:std_dev_task/core/router/page_route.dart';
import 'package:std_dev_task/core/widgets/app_bar.dart';
import 'package:std_dev_task/features/auth/data/datasources/remote/auth_hive.dart';
import 'package:std_dev_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:std_dev_task/features/contact/presentation/pages/cantacts_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Initialize the dependency injector
  locator = GetIt.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STD dev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: STDPageRoute.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState()async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar.appBar("STD dev contacts"),
      body: MultiBlocProvider(
        providers: [
          // Provide the ContactBloc using BlocProvider
          BlocProvider(create: (_) => locator<ContactBloc>())
        ],
        child: const ContactsPage(),
      ),
    );
  }
}
