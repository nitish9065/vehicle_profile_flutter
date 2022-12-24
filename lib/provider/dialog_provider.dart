import 'package:flutter/widgets.dart';

class DialogProvider extends ChangeNotifier {
  bool twoWheeler = false;
  bool fourWheeler = false;
  String twogif = "assets/images/scooter.gif";
  String fourgif = "assets/images/4wheeler.gif";
  String nothing = "assets/images/nothing.gif";

  void setTwoWheeler(bool value) {
    twoWheeler = value;
    fourWheeler = !twoWheeler;
    notifyListeners();
  }

  void setFourWheeler(bool value) {
    fourWheeler = value;
    twoWheeler = !fourWheeler;
    notifyListeners();
  }

  void setAll() {
    twoWheeler = false;
    fourWheeler = false;
    notifyListeners();
  }

  bool getTwo() {
    return twoWheeler;
  }

  bool getFour() {
    return fourWheeler;
  }
}
