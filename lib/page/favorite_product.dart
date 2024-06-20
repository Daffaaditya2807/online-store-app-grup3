import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/database/db_favorite.dart';
import 'package:online_app_final_project/database/db_model_favorite.dart';
import 'package:online_app_final_project/model/all_product.dart';
import 'package:online_app_final_project/page/detail_product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<DbFavoriteModel> favorites = [];

  void loadFavorites() async {
    favorites = await DatabaseHelperFavorite().getListFavItem();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFavorites();
  }

  void deleteItem(String id) async {
    await DatabaseHelperFavorite().deleteFavItem(id);
    loadFavorites(); // Refresh the list after deleting the item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/logodashboard.png"),
            ListView.builder(
              itemCount: favorites.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var items = favorites[index];
                RatingAllProduct rate =
                    RatingAllProduct(rate: items.rate, count: items.count);
                ModelProductAll productAll = ModelProductAll(
                    id: items.id,
                    tittle: items.title,
                    price: items.price,
                    desc: items.desc,
                    category: items.category,
                    image: items.image,
                    rate: rate);
                return InkWell(
                    onTap: () {
                      Get.to(DetailProduct(modelProductAll: productAll));
                    },
                    child: listCart(favorites[index]));
              },
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      )),
    );
  }

  Widget listCart(DbFavoriteModel item) {
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
                        "Rp. ${item.price} K",
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
                    onTap: () => deleteItem(item.id),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: greyLight),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
