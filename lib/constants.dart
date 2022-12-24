import "package:flutter/material.dart";
import 'package:flutter/services.dart';

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);
const Color statusbarColor = Color(0xFFe9ecef);
late final TextEditingController vehiclecontroller;

FocusNode myfocus = FocusNode();
List listCurrentVehicles = [];
List profileList = [];
List<String> fuelList = [
  "Petrol",
  "Diesel",
  "CNG",
  "Petrol+CNG",
  "Electric",
  "Hybrid"
];
List<String> transmissionList = ["Manual", "Automatic"];
String baseUrl = 'https://test.turbocare.app/turbo/care/v1/makes?class=';
String twoWheelerurl =
    "https://test.turbocare.app/turbo/care/v1/models?class=2w&make=honda";

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: primaryColor),
  );
}

const AppBarTheme appbartheme = AppBarTheme(
    backgroundColor: primaryColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: statusbarColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

const TextTheme texttheme = TextTheme(
  bodyText2: TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w600,
      fontFamily: "Gordita"),
);

 ElevatedButtonThemeData elevatedTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>( const EdgeInsets.all(5)),
        minimumSize: MaterialStateProperty.all<Size>( const Size(90, 40)),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor)));
