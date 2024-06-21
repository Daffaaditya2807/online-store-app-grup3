import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  late DatabaseReference dbRef;
  User? user;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("user");
  }

  void createRecord(String email, String password, String name, User user,
      String phone, String alamat) {
    try {
      Map<String, String> userss = {
        'uid': user.uid,
        'nama': name,
        'email': email,
        'phone': phone,
        'password': password,
        'alamat': alamat
      };
      dbRef.push().set(userss).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }).catchError((error) {
        print("Failed to add user: $error");
      });
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?> signUp({String? email, String? password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString());
      user = userCredential.user;
      print("done berhasil kak");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Register"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 2),
            Text(
              'Open an Account',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2029),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Enter your details below to create your account.',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF797979),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Text(
              'Nama',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2029),
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'dekastoreaja',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
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
            const SizedBox(height: 30),
            Text(
              'Email',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2029),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'dekastore@gmail.com',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
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
            const SizedBox(height: 30),
            Text(
              'Phone',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2029),
                ),
              ),
            ),
            TextField(
              controller: _phoneController,
              maxLength: 12,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              buildCounter: (BuildContext context,
                  {int? currentLength, int? maxLength, bool? isFocused}) {
                return null;
              },
              decoration: InputDecoration(
                hintText: '085xxxxxx',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
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
            const SizedBox(height: 30),
            Text(
              'Address',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2029),
                ),
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Road Country...',
                hintStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
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
            const SizedBox(height: 30),
            Text(
              'Password',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
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
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF797979),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF1F2029),
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _nameController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _addressController.text.isEmpty) {
                  _showAlertDialog("Please Complete All Field");
                } else {
                  try {
                    var user = await signUp(
                        email: _emailController.text.trim(),
                        password: _passwordController.text);
                    createRecord(
                        _emailController.text.trim(),
                        _passwordController.text,
                        _nameController.text,
                        user!,
                        _phoneController.text.trim(),
                        _addressController.text);
                  } catch (e) {}
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6F4E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Sign Up',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEDEDED),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
