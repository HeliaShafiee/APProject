import 'package:approject/Screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: const Color(0xFF66AEEF),
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed:(){Navigator.pop(context);}
                  , icon: const Icon(Icons.arrow_back),color: Color(0xFF061F5C))
            ),
            const SizedBox(height: 10),
            //using ShaderMark

            Center(
              child: ShaderMask(shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF001A72),
                  Color(0xFF0A5DBA),
                ],).createShader(bounds),child: Text(
                'BankOra',
                style: GoogleFonts.pacifico(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF061F5C),
                ),
              ),
            ),
          ),
            const SizedBox(height: 2),
             Text(
              'Sign up',
              textAlign: TextAlign.center,
              style:GoogleFonts.manrope(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _buildInput(label : 'Username*', icon: Icons.person_outline),
              const SizedBox(height: 20),
            _buildInput(label: 'Phone number*', icon: Icons.phone_android),
            const SizedBox(height: 20),
            _buildInput(label: 'Email*', icon: Icons.email_outlined),
              const SizedBox(height: 20),
            _buildInput(label : 'Password*',obscure : true,icon:Icons.lock_outline),
            const SizedBox(height: 20),
            _buildInput(label: 'Check password*', obscure: true, icon: Icons.lock_reset),

            const SizedBox(height: 20),
            
            ElevatedButton(onPressed: (){} ,style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 14
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

            ).copyWith(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color(0xFF063A8C);
                    }
                    return const Color(0xFF063A8C);
                  },
              ),
              overlayColor: MaterialStateProperty.all(
                Colors.white.withOpacity(0.1),
              ),
            ),
            child:  Text(
              'Submit',
              style:GoogleFonts.manrope(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            )
          ],
          ),
          ),
    ),
    );
  }

  Widget _buildInput({required String label, bool obscure = false , required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
        style: GoogleFonts.manrope(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFD3DEE9),

            prefixIcon:Icon(icon, color: const Color(0xFF0A5DBA),) ,
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
      ],
    );
  }
}

