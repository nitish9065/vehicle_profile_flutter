import "package:flutter/material.dart";
import 'package:vehicleprofile/constants.dart';

Widget actionButton(VoidCallback onTap, IconData icon, String tooltip) {
  return FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: onTap,
        tooltip: tooltip,
        child:  Icon(
          icon,
          size: 30,
        ),
      );
}
