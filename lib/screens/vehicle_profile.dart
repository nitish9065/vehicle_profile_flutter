import 'package:flutter/material.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/screens/home_page.dart';

class VehicleProfile extends StatelessWidget {
  const VehicleProfile(
      {super.key,
      required this.numberPlate,
      required this.vehicleType,
      required this.make,
      required this.model,
      required this.transmission,
      required this.fueltype,
      required this.imagepath});
  final String numberPlate,
      vehicleType,
      make,
      model,
      fueltype,
      transmission,
      imagepath;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Vehicle Profile",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: primaryColor,
                  fontFamily: "Gordita",
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            pinned: true,
            floating: true,
            backgroundColor: bgColor,
            scrolledUnderElevation: 2,
            automaticallyImplyLeading: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsets.only(left: 10),
              title: RichText(
                  text: TextSpan(
                      text: "$model $fueltype\n",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black87,
                          fontFamily: "Gordita",
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                    TextSpan(
                      text: numberPlate,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black87,
                          fontFamily: "Gordita",
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    )
                  ])),
              background: Image.asset(
                imagepath,
                fit: BoxFit.cover,
              ) //Images.network
              ,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.start,
                    runSpacing: 10,
                    direction: Axis.horizontal,
                    spacing: 10,
                    children: [
                      Text("Number is : $numberPlate"),
                      const Divider(
                        height: 10,
                      ),
                      Text("Type of Vehicle is : $vehicleType"),
                      const Divider(
                        height: 10,
                      ),
                      Text("Make is : $make"),
                      const Divider(
                        height: 10,
                      ),
                      Text("Model is : $model"),
                      const Divider(
                        height: 10,
                      ),
                      Text("Fuel Type is : $fueltype"),
                      const Divider(
                        height: 10,
                      ),
                      Text("Transmission is : $transmission"),
                      const Divider(
                        height: 20,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const MyHomePage(
                                    title: "HomePage",
                                  )),
                          (route) => false);
                      // vehicleP.setAll();
                    },
                    child: const Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gordita",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      )),
    );
  }
}
