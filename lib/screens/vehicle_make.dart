import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/database_api/databaseApi.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/widgets/custom_dialog.dart';
import 'package:vehicleprofile/widgets/future_listtile.dart';

class VehicleMake extends StatefulWidget {
  const VehicleMake({super.key});

  @override
  State<VehicleMake> createState() => _VehicleMakeState();
}

class _VehicleMakeState extends State<VehicleMake> {
  late VehicleProvider vehicleP;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const CustomDialog());
    });
    openBox();
    // InCasedeleting the database....
    // deleteDatabase();
  }

  @override
  Widget build(BuildContext context) {
    vehicleP = Provider.of<VehicleProvider>(context);

    // print("List Is : \n$listtwoWheeler");
    // // print("Whole Data inside the Database is : \n${box!.toMap()}");
    return WillPopScope(
      onWillPop: () {
        vehicleP.setvehicleType('');
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Select Make",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: bgColor,
                    fontSize: 25,
                  ),
            ),
          ),
          body: vehicleP.getvehicleType()==''?Container(color: bgColor,):FutureListTile(
            vehicleP: vehicleP,
          )),
    );
  }
}


/* Container(
        child: Center(
          child: ElevatedButton(
            child: const Text("Show Dialog"),
            onPressed: () async {
              await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const CustomDialog());
              // print("Vehicle Selected is : "+CustomDialog.selectedoption);
            },
          ),
        ),
      ),*/