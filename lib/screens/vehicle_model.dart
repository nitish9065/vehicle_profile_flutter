import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/database_api/databaseApi.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/four_wheelermodel.dart';
import 'package:vehicleprofile/widgets/future_listtile.dart';

class VehicleModel extends StatefulWidget {
  const VehicleModel({super.key});

  @override
  State<VehicleModel> createState() => _VehicleModelState();
}

class _VehicleModelState extends State<VehicleModel> {
  @override
  void initState() {
    super.initState();
    openBox();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleP = Provider.of<VehicleProvider>(context);

    return WillPopScope(
      onWillPop: () {
        vehicleP.setVehicleScreen(true);
        vehicleP.setmake('');
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Select Model",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: bgColor,
                    fontSize: 25,
                  ),
            ),
          ),
          body: vehicleP.getvehicleType().contains("twowheeler")
              ? FutureListTile(vehicleP: vehicleP)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Four WheelerModel"),
                      Expanded(child: fourWheelerModel(vehicleP))
                    ],
                  ),
                )),
    );
  }
}
