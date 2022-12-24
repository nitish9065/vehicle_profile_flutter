import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/fuel_transmission.dart';
import 'package:vehicleprofile/widgets/constant_listtile.dart';

class FuelTypeScreen extends StatelessWidget {
  const FuelTypeScreen({
    super.key,
    required this.appbartitle,
    required this.listData,
  });
  final String appbartitle;
  final List<String> listData;

  @override
  Widget build(BuildContext context) {
    final vehicleP = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appbartitle,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: bgColor,
                  fontSize: 25,
                )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
            children: List.generate(
                listData.length,
                (index) => constantListtile(
                      listData[index],
                      () {
                        vehicleP.setfuelType(listData[index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FuelTransmissionScreen(
                                    appbartitle: "Fuel Transmission",
                                    listData: transmissionList)));
                      },
                    ))),
      ),
    );
  }
}
