import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';

TextField textFieldSearch(
    {TextEditingController? controller,
    String? hintText,
    Function(String)? onSubmitted}) {
  return TextField(
    cursorColor: brownSecondary,
    controller: controller,
    onSubmitted: onSubmitted,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: greyPrimary.withAlpha(40))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: greyPrimary.withAlpha(40))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: greyPrimary.withAlpha(40)))),
  );
}
