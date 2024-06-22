import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/button.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/navigation_bar.dart';

import '../database/db_favorite.dart';

class DoneCheckOut extends StatelessWidget {
  const DoneCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Image.asset("assets/Icon.png"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Payment Complete",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Order creation has been completed, please be patient and wait until the order arrives",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 14),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: button(
                  nameButton: "Complete",
                  onPress: () async {
                    await DatabaseHelperFavorite().clearCart();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationBarBottom(
                            initialIndex: 0,
                          ),
                        ));
                  },
                  colorButton: brownSecondary,
                  textColorButton: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
