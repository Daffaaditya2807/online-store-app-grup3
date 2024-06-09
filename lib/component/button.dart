import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton button(
    {String? nameButton,
    VoidCallback? onPress,
    Color? colorButton,
    Color? textColorButton}) {
  return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(55), backgroundColor: colorButton),
      child: Text(nameButton!,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontSize: 19, color: textColorButton)));
}
