import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/button.dart';
import 'package:online_app_final_project/component/list_colour.dart';

class CartProduct extends StatefulWidget {
  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return listCart();
                },
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: greyLight),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: button(
              nameButton: "Checkout",
              onPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 160),
                            child: Divider(
                              thickness: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub Total",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    )),
                                Text("Rp. 160.000",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Fee",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    )),
                                Text("Rp. 15.000",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Cost",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    )),
                                Text("Rp. 175.000",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 5),
                            child: button(
                                nameButton: "Confirm Checkout",
                                onPress: () {},
                                colorButton: brownSecondary,
                                textColorButton: Colors.white),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              colorButton: brownSecondary,
              textColorButton: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget listCart() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                        color: greyLight,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brown Jacket",
                        style: GoogleFonts.montserrat(fontSize: 16),
                      ),
                      Text(
                        "Rp. 20.000",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: greyLight),
                    child: Center(
                        child: Text(
                      "-",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "2",
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: brownSecondary),
                    child: Center(
                        child: Text(
                      "+",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.white),
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        const Divider()
      ],
    );
  }
}
