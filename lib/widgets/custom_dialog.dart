import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/provider/dialog_provider.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/widgets/choice_chip.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });
  static String selectedoption = '';

  @override
  Widget build(BuildContext context) {
    final pd = Provider.of<DialogProvider>(context);
    final vehicleProvider = Provider.of<VehicleProvider>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
          backgroundColor: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade100, width: 0.75)),
          child: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text("Please Select a Vehicle Type"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image.asset(
                    pd.getTwo()
                        ? pd.twogif
                        : pd.getFour()
                            ? pd.fourgif
                            : pd.nothing,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choiceVehicle("2 Wheeler", pd.getTwo(), (value) {
                      pd.setTwoWheeler(value);
                      // print(
                      //     "2Wheeler Selected: ${pd.getTwo()}\n 4Wheeler Selected : ${pd.getFour()}");
                      popupTimer(context, pd, vehicleProvider);
                    }),
                    choiceVehicle("4 Wheeler", pd.getFour(), (value) {
                      pd.setFourWheeler(value);
                      // print(
                      //     "2Wheeler Selected: ${pd.getTwo()}\n 4Wheeler Selected : ${pd.getFour()}");
                      popupTimer(context, pd, vehicleProvider);
                    }),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Timer popupTimer(BuildContext context, DialogProvider pd,
      VehicleProvider vehicleProvider) {
    return Timer(const Duration(milliseconds: 1000), () {
      Navigator.pop(context);
      CustomDialog.selectedoption = pd.getTwo()
          ? 'twowheeler'
          : pd.getFour()
              ? 'fourwheeler'
              : '';
      vehicleProvider.setvehicleType(CustomDialog.selectedoption);
      Timer(const Duration(milliseconds: 300), () {
        pd.setAll();
      });
    });
  }
}
