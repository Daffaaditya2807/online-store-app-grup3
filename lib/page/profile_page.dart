import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/controller/history_transaction.dart';
import 'package:online_app_final_project/controller/profile_controller.dart';
import 'package:online_app_final_project/page/profile_detail.dart';
import 'package:online_app_final_project/page/splash_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    profileController.fetchProfileByUid(user!.uid.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Profile',
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Stack(
                  children: [
                    CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/user.png')),
                  ],
                ),
                Obx(() {
                  if (profileController.profile.value == null) {
                    return const CircularProgressIndicator();
                  } else {
                    return Text(
                      profileController.profile.value!.name,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: const Color(0xFF1F2029),
                      ),
                    );
                  }
                }),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: ProfileDetail(
                        profileModel: profileController.profile.value!,
                      ),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: SizedBox(
                    height: 35,
                    width: 325,
                    child: Stack(
                      children: [
                        const Positioned(
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
                              color: const Color.fromRGBO(121, 121, 121, 1),
                            ),
                          ),
                        ),
                        const Positioned(
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
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  child: SizedBox(
                    height: 35,
                    width: 325,
                    child: Stack(
                      children: [
                        const Positioned(
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
                                color: const Color.fromRGBO(121, 121, 121, 1),
                              ),
                            )),
                        const Positioned(
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
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(
            "Logout",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: const Color(0xFF1F2029),
            ),
          ),
          content: Text(
            "Are you sure you want to log out?",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xFF1F2029),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color(0xFF1F2029),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                "Logout",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              onPressed: () async {
                // Add your logout logic here
                await FirebaseAuth.instance.signOut();
                Get.offAll(const SplashScreen());
                Get.delete<HistoryTransaction>();
              },
            ),
          ],
        );
      },
    );
  }
}
