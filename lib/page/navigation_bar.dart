import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/product_list.dart';
import 'package:online_app_final_project/page/profile.dart';
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
      const Center(
        child: Text("Halaman Dashboard"),
      ),
      const ProductList(),
      const Center(
        child: Text("Halaman Favorite"),
      ),
      const ProfilePage()
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PersistentTabView(context,
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
          backgroundColor: brownSecondary, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(30.0),
              colorBehindNavBar: Colors.white,
              adjustScreenBottomPaddingOnCurve: true,
              border: Border.all(color: brownPrimary)),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style12 // Choose the nav bar style with this property.
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
