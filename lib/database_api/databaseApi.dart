import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/widgets/custom_toast.dart';
import "package:http/http.dart" as http;

Box? box;

// Open the Hive Database...
Future openBox() async {
  var directory = await getApplicationDocumentsDirectory();
  // print(directory.path);
  Hive.init(directory.path);
  box = await Hive.openBox("VehicleProfile");
  return;
}

// Inserting data inside the database..
Future putData(myJson, VehicleProvider vehicleP) async {
  // await box!.clear();
  if (vehicleP.getVehicleScreen()) {
    box!.put(vehicleP.getvehicleType(), myJson);
    return;
  } else {
    box!.put("twoWheelModel", myJson);
    return;
  }
}

// For Deeleting the data Inside the database..
Future<bool> deleteDatabase() async {
  await openBox();
  // box!.delete('');
  // box!.delete(1);
  box!.clear();
  // box!.clear();
  // print("Data Base is ${box!.toMap()}");
  return Future.value(true);
}

// For putting the profile data inside the database..
Future putProfileData(myprofileJson) async {}
Future<bool> getProfile() async {
  return Future.value(true);
}

Future<bool> getAllData(VehicleProvider vehicleP) async {
// final vehicleP = Provider.of<VehicleProvider>(context);

  await openBox();
  String baseUrlTwoWheeler = '2w';
  String baseUrlFourWheeler = '4w';
  String endpointMake = '';
  String finalUrl = '';

  try {
    if (vehicleP.getVehicleScreen()) {
      endpointMake = vehicleP.getvehicleType().contains("twowheeler")
          ? baseUrlTwoWheeler
          : baseUrlFourWheeler;
      finalUrl = baseUrl + endpointMake;
    } else {
      finalUrl = twoWheelerurl;
    }
    var response = await http.get(Uri.parse(finalUrl));
    var myJson = jsonDecode(response.body);
    await putData(myJson, vehicleP);
  } catch (error) {
    showToast("No Internet Connection!", Colors.red);
  }
  var myMap = box!.toMap()[vehicleP.getVehicleScreen()
      ? vehicleP.getvehicleType()
      : 'twoWheelModel'];
  if (myMap.isEmpty) {
    listCurrentVehicles.add("Empty");
  } else {
    listCurrentVehicles = myMap;
    // print("Whole Database is \n${box!.toMap()}");
    // print("Whole Database inside List is \n$listCurrentVehicles");
  }
  return Future.value(true);
}
