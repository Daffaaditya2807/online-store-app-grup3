import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_app_final_project/database/db_model_cart_item.dart';
import 'package:online_app_final_project/database/db_favorite.dart';

class CartController extends GetxController {
  var cartItems = <DbCartItemModel>[].obs;
  var totalPrice = 0.0.obs;
  var isSend = false.obs;
  late DatabaseReference dbRef;
  User? user;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
    dbRef = FirebaseDatabase.instance.ref().child("transactionHistory");
  }

  void loadCartItems() async {
    var loadedItems = await DatabaseHelperFavorite().getListCartItems();
    cartItems.assignAll(loadedItems);
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice.value = cartItems.fold(0.0, (sum, item) {
      double itemPrice =
          double.tryParse(item.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;
      return sum + (itemPrice * item.quantity);
    });
  }

  void incrementCartItemById(DbCartItemModel item) async {
    int index = cartItems.indexWhere((x) => x.id == item.id);
    if (index != -1) {
      cartItems[index].quantity++;
      await DatabaseHelperFavorite().incrementCartItemById(cartItems[index]);
      cartItems.refresh();
      calculateTotalPrice();
    }
  }

  void decrementCartItemById(DbCartItemModel item) async {
    int index = cartItems.indexWhere((x) => x.id == item.id);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      await DatabaseHelperFavorite().decrementtCartItemById(cartItems[index]);
      cartItems.refresh();
      calculateTotalPrice();
    } else if (cartItems[index].quantity == 1) {
      await DatabaseHelperFavorite().deleteCartItem(item.id);
      cartItems.removeAt(index);
      calculateTotalPrice();
    }
  }

  void createRecordTransaction(
      String uid,
      String metodebayar,
      DateTime tanggal,
      String alamat,
      String phone,
      String nama,
      BuildContext context,
      Widget destination) {
    for (var item in cartItems) {
      String idTransaksi =
          "TXN-${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(1000)}";
      Map<String, dynamic> transaction = {
        'idTransaksi': idTransaksi,
        'uid': uid,
        'nama': nama,
        'title': item.title,
        'quantity': item.quantity.toString(),
        'harga_barang': item.price,
        'harga_total':
            (double.parse(item.price.replaceAll(RegExp(r'[^\d.]'), '')) *
                    item.quantity)
                .toString(),
        'metode_bayar': metodebayar,
        'tanggal': tanggal.toString(),
        'status': 'diproses',
        'alamat': alamat,
        'phone': phone,
        'urlImage': item.image
      };

      isSend = true.obs;
      dbRef.push().set(transaction).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => destination,
            ));
      }).catchError((error) {
        isSend = false.obs;
        print("Failed to add transaction: $error");
      });
    }
  }
}
