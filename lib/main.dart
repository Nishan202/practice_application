import 'package:flutter/material.dart';
import 'package:practice_application/Screens/count_increment.dart';
import 'package:practice_application/Screens/counter.dart';
import 'package:practice_application/Screens/db_data_fetch.dart';
import 'package:practice_application/Screens/get_started.dart';
import 'package:practice_application/Screens/login_screen.dart';
import 'package:practice_application/Screens/note_home_screen.dart';
import 'package:practice_application/Screens/registration_screen.dart';
import 'package:practice_application/Screens/whatsapp_screen.dart';
import 'package:practice_application/Widgets/modal_bottomsheet.dart';
import 'package:practice_application/state_management/data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> DataProvider(), child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Counter()
    );
  }
}