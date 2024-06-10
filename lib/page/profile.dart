import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/page/profile_detail.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () {},
                  color: Color(0xFF1F2029),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Profile",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Color(0xFF1F2029),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Stack(
                children: [
                  CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/profile.jpg')),
                  Positioned(
                      bottom: 26,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 18,
                        ),
                      )),
                ],
              ),
              Text(
                "Kylian Mbappe",
                style: GoogleFonts.getFont(
                  'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: Color(0xFF1F2029),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileDetail()),
                  );
                },
                child: Container(
                  height: 35,
                  width: 325,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Icon(
                            Icons.person_4_outlined,
                            size: 30,
                            color: Color.fromRGBO(121, 121, 121, 1),
                          )),
                      Positioned(
                        top: 5,
                        left: 55,
                        child: Text(
                          "My Profile",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromRGBO(121, 121, 121, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Color.fromRGBO(121, 121, 121, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 80,
                endIndent: 80,
                color: Color.fromRGBO(121, 121, 121, 1),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 325,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Icon(
                            Icons.card_membership,
                            size: 30,
                            color: Color.fromRGBO(121, 121, 121, 1),
                          )),
                      Positioned(
                          top: 5,
                          left: 55,
                          child: Text(
                            "Payment Methods",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color.fromRGBO(121, 121, 121, 1),
                            ),
                          )),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Color.fromRGBO(121, 121, 121, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 80,
                endIndent: 80,
                color: Color.fromRGBO(121, 121, 121, 1),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 325,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 30,
                            color: Color.fromRGBO(121, 121, 121, 1),
                          )),
                      Positioned(
                          top: 5,
                          left: 55,
                          child: Text(
                            "My Order",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color.fromRGBO(121, 121, 121, 1),
                            ),
                          )),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Color.fromRGBO(121, 121, 121, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 80,
                endIndent: 80,
                color: Color.fromRGBO(121, 121, 121, 1),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 325,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Icon(
                            Icons.logout_outlined,
                            size: 30,
                            color: Color.fromRGBO(121, 121, 121, 1),
                          )),
                      Positioned(
                          top: 5,
                          left: 55,
                          child: Text(
                            "Logout",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color.fromRGBO(121, 121, 121, 1),
                            ),
                          )),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Color.fromRGBO(121, 121, 121, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                indent: 80,
                endIndent: 80,
                color: Color.fromRGBO(121, 121, 121, 1),
              )
            ],
          )
        ],
      ),
    );
  }
}
