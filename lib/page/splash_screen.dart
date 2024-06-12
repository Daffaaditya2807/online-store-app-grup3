import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/login.dart';
import 'package:online_app_final_project/page/register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/background.png"))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logoApps(),
              const SizedBox(
                height: 113,
              ),
              Text("Unveil Your True Style",
                  style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: greyLight)),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                    "Explore our latest collection and elevate your style effortlessly",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 19, color: brownPrimary)),
              ),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55)),
                    child: Text("Start Shopping Now",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 19, color: Colors.black))),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                      children: [
                        TextSpan(
                            text: "Sign Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                            style: GoogleFonts.montserrat(
                                color: brownPrimary,
                                decoration: TextDecoration.underline,
                                fontSize: 19,
                                fontWeight: FontWeight.w500)),
                      ]))
            ],
          )
        ],
      ),
    );
  }

  Widget _logoApps() {
    return Image.asset("assets/logosplash.png");
  }
}
