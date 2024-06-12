import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigation_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 2),
            Text(
              'Access Account',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2029),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome back, we\'ve missed you!',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF797979),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Text(
              'Email',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2029),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'dekastore@gmail.comm',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF797979),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Password',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2029),
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: '************',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF797979),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF1F2029),
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationBarBottom(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6F4E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Sign In',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEDEDED),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
