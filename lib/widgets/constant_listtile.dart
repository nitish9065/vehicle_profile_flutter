import 'package:flutter/material.dart';
import 'package:vehicleprofile/constants.dart';

Widget constantListtile(String title, VoidCallback onPress) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
        tileColor: statusbarColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: Text(title),
        contentPadding: const EdgeInsets.only(right: 2, left: 20),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onPress),
  );
}
