import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/e-receipt.dart';

class TransactionHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(TransactionDetailPage(),
                            transition: Transition.rightToLeft);
                      },
                      child: TransactionCard());
                },
              ),
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

Widget TransactionCard() {
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
          _buildTimeAndStatus(),
          Divider(),
          SizedBox(height: 8.0),
          Row(
            children: [
              _buildImage(),
              SizedBox(width: 16.0),
              _buildContent(),
            ],
          ),
          _buildBottonId(),
        ],
      ),
    ),
  );
}

Row _buildTimeAndStatus() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '7 June 2024',
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
          'Done',
          style: GoogleFonts.montserrat(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    ],
  );
}

Widget _buildImage() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/brown_jacket.jpg',
        height: 65,
        width: 65,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Expanded _buildContent() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brown Suite',
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 1.0),
        Text(
          '10 pcs',
          style: GoogleFonts.montserrat(
              color: Colors.grey[600],
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 1.0),
        Text(
          'Rp 10.000.000',
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

Row _buildBottonId() {
  return Row(
    children: [
      Text('#TR2456DEDK', style: TextStyle(color: greyPrimary)),
      SizedBox(width: 16.0),
      Spacer(),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: brownSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          padding: EdgeInsets.all(12.0),
        ),
        child: Text(
          'Buy Again',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}
