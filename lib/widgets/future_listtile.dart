import 'package:flutter/material.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/database_api/databaseApi.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/fuel_selection.dart';
import 'package:vehicleprofile/screens/vehicle_model.dart';
import 'package:vehicleprofile/widgets/custom_dialog.dart';

class FutureListTile extends StatelessWidget {
  const FutureListTile({
    Key? key,
    required this.vehicleP,
  }) : super(key: key);

  final VehicleProvider vehicleP;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllData(vehicleP),
      builder: ((context, snapshot) {
        // print(
        //     "Whole Data inside the List is : \n${box!.toMap().values.toList()}");  [fourwheelerlist, twowheelerlist]
        // print(
        //     "Whole Data inside the Database is : \n${box!.toMap()}");
        if (snapshot.hasData) {
          if (listCurrentVehicles.contains("Empty")) {
            return const Center(
              child: Text("No Data"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(vehicleP.getVehicleScreen()
                      ? CustomDialog.selectedoption.toUpperCase()
                      : "2 Wheeler Model"),
                  Expanded(
                      child: ListView.separated(
                    itemCount: listCurrentVehicles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            if (vehicleP.getVehicleScreen()) {
                              vehicleP.setmake(listCurrentVehicles[index]);
                              vehicleP.setVehicleScreen(false);
                              // print(
                              //     "Vehicle Type & Vehicle Make is ${vehicleP.getvehicleType()} and ${vehicleP.getmake()}");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VehicleModel()));
                            } else {
                              vehicleP.setmodel(listCurrentVehicles[index]);
                              vehicleP.setVehicleScreen(false);
                              // print(
                              //     "Vehicle Make & Vehicle model is ${vehicleP.getmake()} and ${vehicleP.getmodel()} ");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FuelTypeScreen(
                                            appbartitle: "Select Fuel Type",
                                            listData: fuelList,
                                          )));
                              // showToast(
                              //     listCurrentVehicles[index], Colors.green);
                            }
                          },
                          tileColor: statusbarColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          title: Text(listCurrentVehicles[index]),
                          contentPadding:
                              const EdgeInsets.only(right: 2, left: 20),
                          trailing: const Icon(Icons.arrow_forward));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 10,
                      );
                    },
                  ))
                ],
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      }),
    );
  }
}
