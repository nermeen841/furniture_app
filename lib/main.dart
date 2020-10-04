import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/app_Screens/admob_example.dart';
import 'package:furniture_app/screens/Introduction/Home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids
  Admob.initialize();

  // Add a list of test ids.
  // Admob.initialize(testDeviceIds: ['YOUR DEVICE ID']);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(),
     home: HomeScreen(),
    );
  }
}


