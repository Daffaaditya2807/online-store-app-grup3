import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/product_list.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationBarBottom extends StatefulWidget {
  final int initialIndex;
  const NavigationBarBottom({Key? key, this.initialIndex = 0})
      : super(key: key);

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  late PersistentTabController? _controller;

  List<Widget> _buildScreens() {
    return [
      const DashboardPage(),
      const ProductList(),
      const Center(
        child: Text("Halaman Riwayat Transaksi"),
      ),
      const Center(
        child: Text("Halaman Profile"),
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 40,
          right: 40,
        ),
        bottomScreenMargin: 0,
        backgroundColor: brownSecondary,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(30.0),
          colorBehindNavBar: Colors.white,
          adjustScreenBottomPaddingOnCurve: true,
          border: Border.all(color: brownPrimary),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey4,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bag),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey4,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart),
        title: ("Favorite"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey4,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey4,
      ),
    ];
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/logodashboard.png',
              height: 80,
            ),
            SizedBox(height: 1),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyPrimary.withOpacity(0.4)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Explore Our New Arrivals',
                          hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: greyPrimary,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: brownSecondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      // aksi pencarian
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 0.8,
                initialPage: 0,
                pageSnapping: true,
              ),
              items: [0xffC69C6D, 0xff797979].map((color) {
                return Builder(
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Color(color),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Get 50% off on your first purchase',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Enjoy 50% off on your first order. Shop now!',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
