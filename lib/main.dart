import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/dialog_provider.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/home_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DialogProvider()),
        ChangeNotifierProvider(create: (_) => VehicleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myfocus.unfocus(),
      child: MaterialApp(
        title: 'Home Page ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            appBarTheme: appbartheme,
            textTheme: texttheme,
            elevatedButtonTheme: elevatedTheme),
        home: const MyHomePage(title: 'HomePage'),
      ),
    );
  }
}
