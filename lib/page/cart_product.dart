import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/button.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/controller/cart_controller.dart';
import 'package:online_app_final_project/database/db_model_cart_item.dart';
import 'package:online_app_final_project/page/payments_methods.dart';

class CartProduct extends StatefulWidget {
  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final cartController = Get.put(CartController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController.loadCartItems();
  }

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
              Obx(() => ListView.builder(
                    itemCount: cartController.cartItems.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = cartController.cartItems[index];
                      return listCart(item);
                    },
                  )),
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 160),
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
                                Text("Rp. ${cartController.totalPrice.value} K",
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
                                Text("Rp. 15 K",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DottedLine(
                            dashColor: greyPrimary,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Cost",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    )),
                                Text(
                                    "Rp. ${cartController.totalPrice.value + 15} K",
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
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentOptionsPage(),
                                      ));
                                },
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

  Widget listCart(DbCartItemModel item) {
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
                        image: DecorationImage(
                            image: NetworkImage(item.image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          item.title,
                          maxLines: 3,
                          style: GoogleFonts.montserrat(fontSize: 16),
                        ),
                      ),
                      Text(
                        item.price,
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => cartController.decrementCartItemById(item),
                    child: Container(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      item.quantity.toString(),
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    onTap: () => cartController.incrementCartItemById(item),
                    child: Container(
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
