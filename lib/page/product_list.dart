import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/card_list.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/component/text_field.dart';
import 'package:online_app_final_project/page/cart_product.dart';
import 'package:online_app_final_project/page/detail_product.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTabController(
            length: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/logoapp.png")),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
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
                        padding: const EdgeInsets.only(bottom: 80),
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

                              // print(index);
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
      ),
    );
  }
}
