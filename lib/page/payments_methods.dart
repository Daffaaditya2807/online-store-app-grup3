import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';
import 'package:online_app_final_project/page/checkout.dart';

class PaymentOptionsPage extends StatefulWidget {
  @override
  _PaymentOptionsPageState createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  String _selectedPaymentMethod = '';

  void _onPaymentMethodSelected(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Payment Methods',
          textAlign: TextAlign.center,
          style:
              GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 30),
                  // _buildCreateDebitCard(),
                  const SizedBox(height: 30),
                  Text(
                    'Payment Options',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(215, 215, 215, 215)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildPaymentOption(
                          title: 'Paypal',
                          logo: 'assets/paypal.png',
                          value: 'Paypal',
                        ),
                        const Divider(),
                        _buildPaymentOption(
                          title: 'Apple Pay',
                          logo: 'assets/apple-pay.png',
                          value: 'Apple Pay',
                        ),
                        const Divider(),
                        _buildPaymentOption(
                          title: 'Google Pay',
                          logo: 'assets/google-pay.png',
                          value: 'Google Pay',
                        ),
                        const Divider(),
                        _buildPaymentOption(
                          title: 'Cash',
                          logo: 'assets/money.png',
                          value: 'Cash',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButton(() {
            if (_selectedPaymentMethod.isEmpty) {
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutLast(
                      payments: _selectedPaymentMethod,
                    ),
                  ));
            }
          }),
        ],
      ),
    );
  }

  Widget _buildCreateDebitCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credit & Debit Card',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color.fromARGB(215, 215, 215, 215))),
          child: ListTile(
            leading: Icon(Icons.credit_card, color: brownSecondary),
            title: Text(
              'Add Card',
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: greyPrimary),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: brownSecondary),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
      {required String title, required String logo, required String value}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              vertical: 4), // margin between internal borders
          child: RadioListTile(
            activeColor: brownSecondary,
            controlAffinity: ListTileControlAffinity
                .trailing, // This will put the radio button on the right
            secondary: Image.asset(
              logo,
              width: 40,
              height: 40,
            ),
            title: Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: greyPrimary),
            ),
            value: value,
            groupValue: _selectedPaymentMethod,
            onChanged: (String? newValue) {
              _onPaymentMethodSelected(newValue!);
            },
          ),
        ),
      ],
    );
  }

  Positioned _buildBottomButton(VoidCallback onPressed) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(215, 215, 215, 215)),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(27.0),
        child: Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: brownSecondary,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Confirm Payment',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
