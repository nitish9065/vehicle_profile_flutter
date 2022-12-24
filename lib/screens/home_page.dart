import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/vehicle_number.dart';
import 'package:vehicleprofile/screens/vehicle_profile.dart';
import 'package:vehicleprofile/widgets/floating_actionbtn.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List profiledata = [];
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);
    profiledata = vehicleProvider.getProfile();
    // print(profiledata);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: bgColor,
                  fontSize: 25,
                ),
          ),
        ),
        body: profiledata.isEmpty
            ? const Center(
                child: Text("Hii"),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                        profiledata.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: profiledata[index]['vehicletype'] ==
                                        "twowheeler"
                                    ? SvgPicture.asset(
                                        "assets/images/bike.svg",
                                        height: 30,
                                        width: 30,
                                      )
                                    : SvgPicture.asset(
                                        "assets/images/car.svg",
                                        height: 30,
                                        width: 30,
                                      ),
                                tileColor: statusbarColor,
                                title: Text(
                                  profiledata[index]['number'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Colors.black87,
                                          fontFamily: "Gordita"),
                                ),
                                subtitle: Text(profiledata[index]['make'] +
                                    " " +
                                    profiledata[index]['model'] +
                                    "  (" +
                                    profiledata[index]['fueltype'] +
                                    ")"),
                                trailing: const Icon(Icons.arrow_forward),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return VehicleProfile(
                                      numberPlate: profiledata[index]['number'],
                                      vehicleType: profiledata[index]
                                          ['vehicletype'],
                                      make: profiledata[index]['make'],
                                      model: profiledata[index]['model'],
                                      fueltype: profiledata[index]['fueltype'],
                                      transmission: profiledata[index]
                                          ['transmission'],
                                      imagepath: profiledata[index]
                                                  ['vehicletype'] ==
                                              "twowheeler"
                                          ? "assets/images/scooter.gif"
                                          : "assets/images/4wheeler.gif",
                                    );
                                  }));
                                },
                              ),
                            )),
                  ),
                ),
              ),
        floatingActionButton: actionButton(() {
          vehicleProvider.setAll();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const VehicleNumber(title: "New Vehicle Profile")));
        }, Icons.add,
            "Add Vehicle Profile"), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
