import 'package:approject/Screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? phoneError;
  String? passwordError;
  bool obscurePassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF66AEEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'BankOra',
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico(
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF061F5C),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 34),

              _buildInput(label: 'Phone number'),
              const SizedBox(height: 20),
              _buildInput(label: 'Password', obscure: true),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A5DBA),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.manrope(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Let's sign up!",
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF061F5C),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput({required String label, bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0A5DBA).withOpacity(0.25),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: TextField(
            obscureText: label == 'Password' ? obscurePassword: obscure,
            keyboardType:
            obscure ? TextInputType.text : TextInputType.phone,
            onChanged: (value) {
              setState(() {
                if (label == 'Phone number') {
                  phoneError = validatePhoneNumber(value);
                } else if (label == 'Password') {
                  passwordError = validatePassword(value);
                }
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFD3DEE9),

              prefixIcon: Icon(
                obscure ? Icons.lock_outline : Icons.phone_android,
                color: const Color(0xFF0A5DBA),
              ),

              suffixIcon: label == 'Password' ? IconButton(
                  icon : Icon(obscurePassword ?
                          Icons.visibility_off :
                          Icons.visibility,
                          color: const Color(0xFF0A5DBA),),
                onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
              },
              )
              : null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xFF0A5DBA),
                  width: 2,
                ),
              ),
            ),
          ),
        ),

        if (label == 'Phone number' && phoneError != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 8),
            child: Text(
              phoneError!,
              style: GoogleFonts.manrope(
                color: Colors.redAccent,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        if (label == 'Password' && passwordError != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 8),
            child: Text(
              passwordError!,
              style: GoogleFonts.manrope(
                color: Colors.redAccent,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  //Validate methods

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number must be 11 digits';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Phone number must contain digits only!';
    }

    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 8) {
      return 'Password must be at least 8 characters!';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain an uppercase letter!';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain a lowercase letter!';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain a digit!';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain a special character!';
    }

    return null;
  }
}
