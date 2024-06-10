import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_app_final_project/component/list_colour.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Payment Options',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: PaymentOptionsPage(),
//     );
//   }
// }

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
        title: Text('Payments Methods'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _buildCreateDebitCard(),
                SizedBox(height: 30),
                Text(
                  'More Payment Options',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: greyLight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      _buildPaymentOption(
                        title: 'Paypal',
                        logo: 'assets/paypal.png',
                        value: 'Paypal',
                      ),
                      _buildPaymentOption(
                        title: 'Apple Pay',
                        logo: 'assets/apple-pay.png',
                        value: 'Apple Pay',
                      ),
                      _buildPaymentOption(
                        title: 'Google Pay',
                        logo: 'assets/google-pay.png',
                        value: 'Google Pay',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Positioned _buildBottomButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: brownSecondary, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded edges
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
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
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
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
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: 4), // margin between internal borders
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
              fontSize: 18, fontWeight: FontWeight.normal, color: greyPrimary),
        ),
        value: value,
        groupValue: _selectedPaymentMethod,
        onChanged: (String? newValue) {
          _onPaymentMethodSelected(newValue!);
        },
      ),
    );
  }
}

// Widget _buildContainerPaypal() {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border(
//         left: BorderSide(color: Colors.grey, width: 2.0),
//         top: BorderSide(color: Colors.grey, width: 2.0),
//         right: BorderSide(color: Colors.grey, width: 2.0),
//       ),
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );
// }

// Widget _buildContainerApplePay() {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border(
//         left: BorderSide(color: Colors.grey, width: 2.0),
//         right: BorderSide(color: Colors.grey, width: 2.0),
//       ),
//     ),
//   );
// }

// Widget _buildContainerGooglePay() {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border(
//         left: BorderSide(color: Colors.grey, width: 2.0),
//         bottom: BorderSide(color: Colors.grey, width: 2.0),
//         right: BorderSide(color: Colors.grey, width: 2.0),
//       ),
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );
// }
