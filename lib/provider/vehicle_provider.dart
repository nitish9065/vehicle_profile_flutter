import 'package:flutter/cupertino.dart';
import 'package:vehicleprofile/constants.dart';

class VehicleProvider extends ChangeNotifier {
  String numberPlate = '';
  String vehicleType = '';
  String fuelType = '';
  String transmission = '';
  String model = '';
  String make = '';
  bool isVehicleTypeScreen = false;

  void setVehicleScreen(bool val) {
    isVehicleTypeScreen = val;
    notifyListeners();
  }

  bool getVehicleScreen() {
    return isVehicleTypeScreen;
  }

  String getNumber() {
    return numberPlate;
  }

  void setNumber(String number) {
    numberPlate = number;
    notifyListeners();
  }

  String getvehicleType() {
    return vehicleType;
  }

  void setvehicleType(String number) {
    vehicleType = number;
    notifyListeners();
  }

  String getfuelType() {
    return fuelType;
  }

  void setfuelType(String number) {
    fuelType = number;
    notifyListeners();
  }

  String gettransmission() {
    return transmission;
  }

  void settransmission(String number) {
    transmission = number;
    notifyListeners();
  }

  String getmodel() {
    return model;
  }

  void setmodel(String number) {
    model = number;
    notifyListeners();
  }

  String getmake() {
    return make;
  }

  void setmake(String number) {
    make = number;
    notifyListeners();
  }

  void setAll() {
    numberPlate = '';
    vehicleType = '';
    fuelType = '';
    transmission = '';
    model = '';
    make = '';
    isVehicleTypeScreen = false;
    notifyListeners();
  }

  List getProfile() {
    if (numberPlate.isNotEmpty &&
        vehicleType.isNotEmpty &&
        fuelType.isNotEmpty &&
        transmission.isNotEmpty &&
        model.isNotEmpty &&
        make.isNotEmpty) {
      Map<String, String> profileJson = {
        "number": getNumber(),
        "vehicletype": getvehicleType(),
        "make": getmake(),
        "model": getmodel(),
        "fueltype": getfuelType(),
        "transmission": gettransmission()
      };
      if (!profileList.any((element) => element['number'] == getNumber())) {
        profileList.add(profileJson);
      }
    }

    return profileList;
  }
}
