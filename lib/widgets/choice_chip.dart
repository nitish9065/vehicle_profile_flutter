import 'package:flutter/material.dart';
import 'package:vehicleprofile/constants.dart';

ChoiceChip choiceVehicle(String label, bool isSelected, Function(bool) onTap) {
  return ChoiceChip(
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    label: Text(
      label,
      style: const TextStyle(
          color: Colors.black, letterSpacing: 1.5, fontWeight: FontWeight.w600),
    ),
    selected: isSelected,
    backgroundColor: primaryColor,
    selectedColor: Colors.green,
    onSelected: onTap,
  );
}
