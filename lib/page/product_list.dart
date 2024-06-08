import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                  child: Text(
                    "Product",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: brownSecondary,
                        decoration: InputDecoration(
                            hintText: "Explore Our New Arrivals",
                            hintStyle: GoogleFonts.montserrat(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: greyPrimary.withAlpha(40))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: greyPrimary.withAlpha(40))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: greyPrimary.withAlpha(40)))),
                      ),
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  unselectedBorderColor: greyPrimary.withAlpha(40),
                  borderWidth: 1,
                  unselectedBackgroundColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  decoration: BoxDecoration(color: brownSecondary),
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.white),
                  height: 50,
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Jacket",
                    ),
                    Tab(
                      text: "Shirt",
                    ),
                    Tab(
                      text: "Men",
                    ),
                    Tab(
                      text: "Kids",
                    ),
                    Tab(
                      text: "Women",
                    ),
                  ],
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
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: greyPrimary.withAlpha(40))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: greyLight,
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/brown_jacket.jpg")),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Brown Jacket",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.orange.shade400,
                                          ),
                                          Text("1.2",
                                              style: GoogleFonts.montserrat()),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text("Rp. 12.000",
                                      style:
                                          GoogleFonts.montserrat(fontSize: 14))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Center(
                        child: Text("Available Soon!"),
                      ),
                      Center(
                        child: Text("Available Soon!"),
                      ),
                      Center(
                        child: Text("Available Soon!"),
                      ),
                      Center(
                        child: Text("Available Soon!"),
                      ),
                      Center(
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
