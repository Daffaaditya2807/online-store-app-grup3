import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/controller/history_transaction.dart';
import 'package:online_app_final_project/model/transaction_history.dart';
import 'package:online_app_final_project/page/e-receipt.dart';

class TransactionHistoryPage extends StatefulWidget {
  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  User? user;
  HistoryTransaction? transactionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    transactionController =
        Get.put(HistoryTransaction(uidTrans: user!.uid), tag: user!.uid);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'My Order',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Obx(() {
                if (transactionController!.historyTrans.isEmpty) {
                  return const Center(child: Text("Tidak Ada Riwayat History"));
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: transactionController!.historyTrans.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var itemsValues =
                          transactionController!.historyTrans[index];
                      return InkWell(
                          onTap: () {
                            Get.to(
                                TransactionDetailPage(
                                  historyTransaksiModel: itemsValues,
                                ),
                                transition: Transition.rightToLeft);
                          },
                          child: TransactionCard(itemsValues));
                    },
                  );
                }
              }),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget TransactionCard(HistoryTransaksiModel items) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeAndStatus(items.status, items.tanggal),
          Divider(),
          SizedBox(height: 8.0),
          Row(
            children: [
              _buildImage(items.urlImage),
              SizedBox(width: 16.0),
              _buildContent(items.title, items.quantity, items.hargaTotal),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildBottonId(items.idTransaksi),
        ],
      ),
    ),
  );
}

Row _buildTimeAndStatus(String status, String tanggal) {
  DateTime dateTime = DateTime.parse(tanggal);
  String formatedDate = DateFormat('d MMMM y', 'id_ID').format(dateTime);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        formatedDate,
        style: GoogleFonts.montserrat(
            color: greyPrimary, fontSize: 15, fontWeight: FontWeight.w600),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          status,
          style: GoogleFonts.montserrat(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    ],
  );
}

Widget _buildImage(String urlImage) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        urlImage,
        height: 65,
        width: 65,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Expanded _buildContent(String name, String quantity, String harga) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 1.0),
        Text(
          '$quantity pcs',
          style: GoogleFonts.montserrat(
              color: Colors.grey[600],
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 1.0),
        Text(
          'Rp $harga K',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.0),
      ],
    ),
  );
}

Row _buildBottonId(String id) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('#$id', style: TextStyle(color: greyPrimary)),
      // SizedBox(width: 16.0),
      // Spacer(),
      // ElevatedButton(
      //   onPressed: () {},
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: brownSecondary,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(6.0),
      //     ),
      //     padding: EdgeInsets.all(12.0),
      //   ),
      //   child: Text(
      //     'Buy Again',
      //     style: GoogleFonts.montserrat(
      //       color: Colors.white,
      //       fontSize: 17,
      //       fontWeight: FontWeight.normal,
      //     ),
      //   ),
      // ),
    ],
  );
}
