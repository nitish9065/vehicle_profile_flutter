import 'package:flutter/material.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/fuel_selection.dart';
import 'package:vehicleprofile/widgets/constant_listtile.dart';

List<String> fourWheelerCarModel = [
  "Swift",
  "Dzire New ",
  'Wagen R',
  "Echo",
  "Cimarron",
  "Forester",
  "Montana",
  "Sequoia",
  "Viscount",
  "Cirrus",
  "Forte",
  "Monte",
  "Carlo",
  "Seville",
  "Vision",
  "Colt",
  "Galant",
  "Mustang",
  "Gallardo",
  "Navajo",
  "Spur",
  "Wrangler",
  "Skyhawk",
  "Continental",
];

Widget fourWheelerModel(VehicleProvider vehicleP) {
  return ListView.separated(
      itemBuilder: ((context, index) {
        return constantListtile(fourWheelerCarModel[index], () {
          vehicleP.setmodel(fourWheelerCarModel[index]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FuelTypeScreen(
                        appbartitle: 'Select Fuel Type',
                        listData: fuelList,
                      )));
        });
      }),
      separatorBuilder: ((context, index) => const Divider(
            height: 10,
          )),
      itemCount: fourWheelerCarModel.length);
}
