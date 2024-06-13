import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/dashboard.dart';
import 'package:online_app_final_project/page/favorite_product.dart';
import 'package:online_app_final_project/page/my_order.dart';
import 'package:online_app_final_project/page/product_list.dart';
import 'package:online_app_final_project/page/profile_page.dart';

class NavigationBarBottom extends StatefulWidget {
  final int initialIndex;
  const NavigationBarBottom({Key? key, this.initialIndex = 0})
      : super(key: key);

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  int pageSelected = 0;
  late PageController? _myPage;

  List<Widget> _buildScreens() {
    return [
      const DashboardPage(),

      // Halaman Favorite taruh bawah IMPORT
      const FavoritePage(),
      // Halaman Transaksi taruh bawah IMPORT
      TransactionHistoryPage(),
      // Halaman Profile taruh bawah IMPORT
      const Profile()
    ];
  }

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: widget.initialIndex);
    pageSelected = widget.initialIndex;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _myPage?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _myPage,
        onPageChanged: (value) {
          setState(() {
            pageSelected = value;
          });
        },
        children: _buildScreens(),
      ),
      floatingActionButton:
          _navbarCostum(pageSelected: pageSelected, myPage: _myPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _navbarCostum({int? pageSelected, PageController? myPage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: brownSecondary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 0 ? Colors.white : brownSecondary),
                child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          myPage?.jumpToPage(0);
                          pageSelected = 0;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.house_fill,
                        color:
                            pageSelected == 0 ? brownSecondary : Colors.white,
                        size: 30,
                      ),
                    )),
              ),
              // AnimatedContainer(
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.ease,
              //   decoration: ShapeDecoration(
              //       shape: const CircleBorder(),
              //       color: pageSelected == 1 ? Colors.white : brownSecondary),
              //   child: Padding(
              //       padding: const EdgeInsets.all(3),
              //       child: IconButton(
              //         onPressed: () {
              //           setState(() {
              //             myPage?.jumpToPage(1);
              //             pageSelected = 1;
              //           });
              //         },
              //         icon: Icon(
              //           CupertinoIcons.cart,
              //           color:
              //               pageSelected == 1 ? brownSecondary : Colors.white,
              //           size: 30,
              //         ),
              //       )),
              // ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 1 ? Colors.white : brownSecondary),
                child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          myPage?.jumpToPage(1);
                          pageSelected = 1;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.heart,
                        color:
                            pageSelected == 1 ? brownSecondary : Colors.white,
                        size: 30,
                      ),
                    )),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 2 ? Colors.white : brownSecondary),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          myPage?.jumpToPage(2);
                          pageSelected = 2;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.doc_text,
                        color:
                            pageSelected == 2 ? brownSecondary : Colors.white,
                        size: 30,
                      )),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 3 ? Colors.white : brownSecondary),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          myPage?.jumpToPage(3);
                          pageSelected = 3;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.profile_circled,
                        color:
                            pageSelected == 3 ? brownSecondary : Colors.white,
                        size: 30.0,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
