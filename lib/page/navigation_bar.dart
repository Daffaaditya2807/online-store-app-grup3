import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_app_final_project/page/dashboard.dart';
import 'package:online_app_final_project/page/favorite_product.dart';
import 'package:online_app_final_project/page/product_list.dart';

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

      const ProductList(),
      // Halaman Favorite taruh bawah IMPORT
      const FavoritePage(),
      // Halaman Transaksi taruh bawah IMPORT
      const Scaffold(
        body: Center(child: Text("Halaman Transaksi Soon!")),
      ),
      // Halaman Profile taruh bawah IMPORT
      const Scaffold(
        body: Center(child: Text("Halaman Profile Soon!")),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: widget.initialIndex);
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
            color: const Color(0xff704F38),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 0
                        ? Colors.white
                        : const Color(0xff704F38)),
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
                        CupertinoIcons.home,
                        color: pageSelected == 0
                            ? const Color(0xff704F38)
                            : Colors.white,
                        size: 30,
                      ),
                    )),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 1
                        ? Colors.white
                        : const Color(0xff704F38)),
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
                        CupertinoIcons.cart,
                        color: pageSelected == 1
                            ? const Color(0xff704F38)
                            : Colors.white,
                        size: 30,
                      ),
                    )),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 2
                        ? Colors.white
                        : const Color(0xff704F38)),
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
                        CupertinoIcons.heart,
                        color: pageSelected == 2
                            ? const Color(0xff704F38)
                            : Colors.white,
                        size: 30,
                      ),
                    )),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 3
                        ? Colors.white
                        : const Color(0xff704F38)),
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
                        CupertinoIcons.doc_text,
                        color: pageSelected == 3
                            ? Color(0xff704F38)
                            : Colors.white,
                        size: 30,
                      )),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: pageSelected == 4
                        ? Colors.white
                        : const Color(0xff704F38)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          myPage?.jumpToPage(4);
                          pageSelected = 4;
                        });
                      },
                      icon: Icon(
                        CupertinoIcons.profile_circled,
                        color: pageSelected == 4
                            ? Color(0xff704F38)
                            : Colors.white,
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
