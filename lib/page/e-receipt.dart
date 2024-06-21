import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:intl/intl.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:flutter/services.dart';
import 'package:online_app_final_project/model/transaction_history.dart';

class TransactionDetailPage extends StatefulWidget {
  final HistoryTransaksiModel historyTransaksiModel;
  const TransactionDetailPage({Key? key, required this.historyTransaksiModel})
      : super(key: key);

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  final String transactionId = '#TR2456DEDK';

  @override
  Widget build(BuildContext context) {
    String dateTimeString = widget.historyTransaksiModel.tanggal.toString();
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('d MMMM y, h:mm a').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'E-Receipt',
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
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
                          child: Image.network(
                            widget.historyTransaksiModel.urlImage,
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
                                widget.historyTransaksiModel.title,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Qty: ${widget.historyTransaksiModel.quantity}pcs',
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Rp. ${widget.historyTransaksiModel.hargaBarang} K',
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
                    buildTransactionDetailRow('Amount',
                        'Rp. ${widget.historyTransaksiModel.hargaTotal} K'),
                    buildTransactionDetailRow('Delivery Charge', 'Rp.0 K'),
                    buildTransactionDetailRow('Promo', '-Rp.0 K'),
                    SizedBox(height: 10),
                    DottedLine(dashColor: greyPrimary),
                    SizedBox(height: 10),
                    buildTransactionDetailRow('Total',
                        'Rp. ${widget.historyTransaksiModel.hargaTotal} K'),
                    SizedBox(height: 10),
                    Divider(),
                    buildTransactionDetailRow('Payment Methods',
                        '${widget.historyTransaksiModel.metodeBayar}'),
                    buildTransactionDetailRow('Date', formattedDate),
                    buildTransactionDetailRowWithIcon(
                      'ID Trans',
                      widget.historyTransaksiModel.idTransaksi,
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
          // buildBottomButton(),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: brownSecondary,
            minimumSize: Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            'Download E-Receipt',
            style: GoogleFonts.montserrat(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
