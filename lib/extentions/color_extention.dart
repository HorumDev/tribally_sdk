import 'package:flutter/material.dart';

extension ColorToHexString on Color {
  toHexString(){
    return value.toRadixString(16).padLeft(8, '0');
  }
}