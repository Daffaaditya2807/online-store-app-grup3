import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_app_final_project/api/api_product.dart';
import 'package:online_app_final_project/component/button.dart';
import 'package:online_app_final_project/component/card_list.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/model/all_product.dart';

class DetailProduct extends StatefulWidget {
  final ModelProductAll modelProductAll;
  const DetailProduct({Key? key, required this.modelProductAll})
      : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final ProductAllControllerByCategory _productAllControllerByCategory =
      Get.put(ProductAllControllerByCategory());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productAllControllerByCategory.fetchProdukByCategoryDetail(
          category: widget.modelProductAll.category);
    });
  }

  IconData getLogoCategory(String category) {
    if (category == 'jewelery') {
      return MdiIcons.diamond;
    } else if (category == "men's clothing") {
      return MdiIcons.tshirtCrew;
    } else if (category == "women's clothing") {
      return MdiIcons.tshirtCrew;
    } else {
      return Icons.electric_bolt_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.modelProductAll.image))),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: const ShapeDecoration(
                              shape: CircleBorder(), color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back))),
                      Container(
                          decoration: const ShapeDecoration(
                              shape: CircleBorder(), color: Colors.white),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border))),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.modelProductAll.tittle,
                          maxLines: 2,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              getLogoCategory(widget.modelProductAll.category)),
                          Text(widget.modelProductAll.category,
                              style: GoogleFonts.montserrat(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange.shade400,
                          ),
                          Text(widget.modelProductAll.rate.rate,
                              style: GoogleFonts.montserrat(fontSize: 14)),
                          Text("(${widget.modelProductAll.rate.count})",
                              style: GoogleFonts.montserrat(fontSize: 10)),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Rp. ${widget.modelProductAll.price} K",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: brownSecondary)),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(15)),
                      //   color: brownSecondary,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 15, vertical: 10),
                      //     child: Text("Available 5",
                      //         style: GoogleFonts.montserrat(
                      //             fontSize: 12, color: Colors.white)),
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Description",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(widget.modelProductAll.desc,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Colors.black)),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Similiar Product",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 180,
              child: Obx(() {
                if (_productAllControllerByCategory.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _productAllControllerByCategory
                        .productListDetail.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var products = _productAllControllerByCategory
                          .productListDetail[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(DetailProduct(modelProductAll: products));
                          },
                          child: cardDetailProduct(
                              asset: products.image,
                              item: products.tittle,
                              harga: "Rp. ${products.price} K"),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: button(
                    nameButton: "Add to Cartssssss",
                    textColorButton: Colors.white,
                    onPress: () {
                      _showAlertDialog(context);
                    },
                    colorButton: brownSecondary)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(10.0),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/Icon.png",
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hurrayy :)',
                style: GoogleFonts.montserrat(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: brownSecondary),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Item addes successfully',
                style: GoogleFonts.montserrat(
                    fontSize: 14.0, color: brownSecondary),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(45),
                      backgroundColor: brownSecondary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "View My Cart",
                    style: GoogleFonts.montserrat(color: Colors.white),
                  )),
            )
          ],
        );
      },
    );
  }
}
