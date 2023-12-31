import 'package:flutter/material.dart';

abstract class FontStyle {
  static const TextStyle labelLarge = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle labelMedium = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle titleLarge = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleMedium = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleSmall = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
