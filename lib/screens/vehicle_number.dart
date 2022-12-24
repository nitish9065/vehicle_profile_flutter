import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleprofile/constants.dart';
import 'package:vehicleprofile/provider/vehicle_provider.dart';
import 'package:vehicleprofile/screens/vehicle_make.dart';
import 'package:vehicleprofile/widgets/floating_actionbtn.dart';

class VehicleNumber extends StatefulWidget {
  const VehicleNumber({super.key, required this.title});
  final String title;

  @override
  State<VehicleNumber> createState() => _VehicleNumberState();
}

class _VehicleNumberState extends State<VehicleNumber> {
  late TextEditingController vehiclecontroller;

  @override
  void initState() {
    super.initState();
    vehiclecontroller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    vehiclecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    final vehicleP = Provider.of<VehicleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: bgColor,
                fontSize: 25,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            "Vehicle Number",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: formkey,
            child: TextFormField(
              focusNode: myfocus,
              validator: (number) {
                if (isValidNumber(number)) {
                  return null;
                } else {
                  return "Please Enter the Vehicle Number!";
                }
              },
              controller: vehiclecontroller,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                border: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                labelText: "Vehicle Number",
                alignLabelWithHint: true, // center labastyle
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: actionButton(() {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          myfocus.unfocus();
          vehicleP.setNumber(vehiclecontroller.text.toString());
          vehicleP.setVehicleScreen(true);

          // print("Number Plate is ${vehicleP.getNumber()}");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const VehicleMake()));
          // use the email provided here
        } else {
          myfocus.unfocus();
        }
      }, Icons.arrow_forward_ios, "Tap To Select Car Company"),
    );
  }

  bool isValidNumber(String? number) {
    return number!.isNotEmpty;
  }
}
