import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/card_list.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/component/text_field.dart';
import 'package:online_app_final_project/page/cart_product.dart';
import 'package:online_app_final_project/page/detail_product.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _controllerSearch = TextEditingController();

  List<Tab> categoryProduct = [
    const Tab(
      text: "All",
    ),
    const Tab(
      text: "Jacket",
    ),
    const Tab(
      text: "Shirt",
    ),
    const Tab(
      text: "Men",
    ),
    const Tab(
      text: "Kids",
    ),
    const Tab(
      text: "Women",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DefaultTabController(
          length: 6,
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
                    child: textFieldSearch(
                        controller: _controllerSearch,
                        onSubmitted: (value) {
                          // fungsi cari barang
                          print(value);
                        },
                        hintText: "Explore Your Our Products!"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: brownSecondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IconButton(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: CartProduct(),
                              withNavBar:
                                  false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          icon: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          )),
                    ),
                  )
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
              const SizedBox(
                height: 10,
              ),
              Text(
                "Category Product",
                style: GoogleFonts.montserrat(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonsTabBar(
                radius: 15,
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                unselectedBorderColor: greyPrimary.withAlpha(40),
                borderWidth: 1,
                unselectedBackgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                decoration: BoxDecoration(color: brownSecondary),
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.white),
                height: 50,
                tabs: categoryProduct,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    GridView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              childAspectRatio: 0.9,
                              crossAxisCount: 2),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: DetailProduct(),
                              withNavBar:
                                  false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: cardProduct(
                              asset: "assets/brown_jacket.jpg",
                              item: "Brown Jacket",
                              rate: "1.2",
                              harga: "Rp. 50.000"),
                        );
                      },
                    ),
                    const Center(
                      child: Text("Available Soon!"),
                    ),
                    const Center(
                      child: Text("Available Soon!"),
                    ),
                    const Center(
                      child: Text("Available Soon!"),
                    ),
                    const Center(
                      child: Text("Available Soon!"),
                    ),
                    const Center(
                      child: Text("Available Soon!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
