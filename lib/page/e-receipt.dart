import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:flutter/services.dart';

class TransactionDetailPage extends StatelessWidget {
  final String transactionId = '#TR2456DEDK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            Text(
              'E-Receipt',
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child:
                          Image.asset('assets/Deka_Store_Logo.png', height: 60),
                    ),
                    Divider(),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/brown_jacket.jpg',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Brown Suite',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Size: XL || Qty: 10pcs',
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Rp.10.000.000',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(),
                    buildTransactionDetailRow('Amount', 'Rp.10.000.000'),
                    buildTransactionDetailRow('Delivery Charge', 'Rp.0'),
                    buildTransactionDetailRow('Promo', '-Rp.500.000'),
                    SizedBox(height: 10),
                    DottedLine(dashColor: greyPrimary),
                    SizedBox(height: 10),
                    buildTransactionDetailRow('Total', 'Rp.9.500.000'),
                    SizedBox(height: 10),
                    Divider(),
                    buildTransactionDetailRow('Payment Methods', 'Cash'),
                    buildTransactionDetailRow('Date', '6 June 2024, 3:47 PM'),
                    buildTransactionDetailRowWithIcon(
                      'Transaction ID',
                      transactionId,
                      Icons.copy,
                      20.0,
                      () {
                        Clipboard.setData(ClipboardData(text: transactionId));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Transaction ID copied to clipboard')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          buildBottomButton(),
        ],
      ),
    );
  }

  Widget buildTransactionDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: greyPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransactionDetailRowWithIcon(String label, String value,
      IconData icon, double iconSize, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: greyPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                icon: Icon(
                  icon,
                  size: iconSize,
                  color: brownSecondary,
                ),
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildBottomButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(215, 215, 215, 215)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.all(27.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: brownSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 65.0, vertical: 10.0),
            child: Text(
              'Download E-Receipt',
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
