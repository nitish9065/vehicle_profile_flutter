import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/vehicle_profile.dart';
import 'package:vehicleprofile/widgets/constant_listtile.dart';

class FuelTransmissionScreen extends StatelessWidget {
  const FuelTransmissionScreen(
      {super.key, required this.appbartitle, required this.listData});
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
                        vehicleP.settransmission(listData[index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehicleProfile(
                                      numberPlate: vehicleP.getNumber(),
                                      vehicleType: vehicleP.getvehicleType(),
                                      make: vehicleP.getmake(),
                                      model: vehicleP.getmodel(),
                                      fueltype: vehicleP.getfuelType(),
                                      transmission: vehicleP.gettransmission(),
                                      imagepath: vehicleP.getvehicleType() ==
                                              "twowheeler"
                                          ? "assets/images/scooter.gif"
                                          : "assets/images/4wheeler.gif",
                                    )));
                      },
                    ))),
      ),
    );
  }
}
