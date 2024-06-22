import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/button.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/component/text_field.dart';
import 'package:online_app_final_project/controller/cart_controller.dart';
import 'package:online_app_final_project/controller/profile_controller.dart';
import 'package:online_app_final_project/database/db_model_cart_item.dart';
import 'package:online_app_final_project/page/done_checkout.dart';

// ignore: must_be_immutable
class CheckoutLast extends StatefulWidget {
  String payments;
  CheckoutLast({Key? key, required this.payments}) : super(key: key);

  @override
  State<CheckoutLast> createState() => _CheckoutLastState();
}

class _CheckoutLastState extends State<CheckoutLast> {
  final cartController = Get.put(CartController());
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final profileController = Get.put(ProfileController());

  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      profileController.fetchProfileByUid(user!.uid);
      profileController.profile.listen((profile) {
        if (profile != null) {
          _nama.text = profile.name;
          _phone.text = profile.phone;
          _alamat.text = profile.alamat;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          textAlign: TextAlign.center,
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textfield(
                  label: "Name",
                  hintText: "Enter Your Name",
                  controller: _nama),
              const SizedBox(
                height: 10,
              ),
              textfield(
                  label: "Phone Number",
                  hintText: "Enter Your Number Phone",
                  controller: _phone),
              const SizedBox(
                height: 10,
              ),
              textfieldDesc(
                  label: "Address",
                  hintText: "Enter Your Address",
                  controller: _alamat),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Items',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => ListView.builder(
                    itemCount: cartController.cartItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var items = cartController.cartItems[index];
                      return listCart(items);
                    },
                  )),
              Text(
                'Detail Payment',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              detailPayment(),
              const SizedBox(
                height: 20,
              ),
              button(
                  nameButton: 'Make Order',
                  colorButton: brownSecondary,
                  onPress: () {
                    // String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
                    String uid = user!.uid;
                    DateTime tanggal = DateTime.now();
                    String metodeBayar = widget.payments;
                    cartController.createRecordTransaction(
                        uid,
                        metodeBayar,
                        tanggal,
                        _alamat.text,
                        _phone.text,
                        _nama.text,
                        context,
                        const DoneCheckOut());
                  },
                  textColorButton: Colors.white),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget detailPayment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub Total',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Obx(() => Text(
                  "Rp. ${cartController.totalPrice.toString()} K",
                  style: GoogleFonts.montserrat(fontSize: 12),
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Text(
              'Rp. 15k',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Text(
              'Rp. 0',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Text(
              widget.payments,
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const DottedLine(),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Cost',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
            Text(
              'Rp. ${cartController.totalPrice.value + 15} K',
              style: GoogleFonts.montserrat(
                  fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
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
                    width: 70,
                    height: 70,
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
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ),
                      Text(
                        "Rp. ${item.price} K",
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              Text(
                "x${item.quantity.toString()}",
                style: GoogleFonts.montserrat(),
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
