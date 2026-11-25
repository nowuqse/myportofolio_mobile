import 'package:flutter/material.dart';

abstract final class AppTheme {
  // Pink palette
  static const Color pinkStart = Color.fromARGB(255, 255, 246, 246);
  static const Color pinkEnd = Color(0xFFEF3D8B);

  // Yellow palette
  static const Color yellowStart = Color(0xFFFFFFF3);
  static const Color yellowEnd = Color(0xFFFFE26F);

  // Green palette
  static const Color greenStart = Color(0xFFE8F7D0);
  static const Color greenEnd = Color(0xFFB5ED79);

  // Blue palette
  static const Color blueStart = Color(0xFFE0E8FA);
  static const Color blueEnd = Color(0xFF61D0FF);

  // Purple palette (Soft Lavender)
  static const Color purpleStart = Color(
    0xFFF3E5F5,
  ); // Sangat terang (hampir putih)
  static const Color purpleEnd = Color(0xFFBA68C8); // Ungu pastel yang cerah

  static const LinearGradient pinkGradient = LinearGradient(
    colors: [pinkStart, pinkEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient yellowGradient = LinearGradient(
    colors: [yellowStart, yellowEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [greenStart, greenEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [blueStart, blueEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [purpleStart, purpleEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
