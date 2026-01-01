import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  String? usernameError;
  String? phoneError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? selectedDomain;
  final List<String> emailDomains = [
    'gmail.com',
    'yahoo.com',
    'outlook.com',
    'icloud.com',
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: const Color(0xFF66AEEF),
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
          child : SingleChildScrollView(
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
            _buildInput(
              label: 'Username*',
              icon: Icons.person_outline,
              controller: usernameController,
              errorText: usernameError,
              onChanged: (value) {
                setState(() {
                  usernameError = validateUsername(value);
                });
              },
            ),
            const SizedBox(height: 20),

            _buildInput(
              label: 'Phone number*',
              icon: Icons.phone_android,
              controller: phoneController,
              errorText: phoneError,
              onChanged: (value) {
                setState(() {
                  phoneError = validatePhoneNumber(value);
                });
              },
            ),
            const SizedBox(height: 16),


            _buildInput(
              label: 'Email*',
              icon: Icons.email_outlined,
              controller: emailController,
              errorText: emailError,
              onChanged: (value) {
                setState(() {
                  emailError = validateEmail(value);
                  if (!value.contains('@')) {
                    selectedDomain = null;
                  }
                });
              },
            ),
            if (shouldShowEmailDomainDropdown(emailController.text))
              DropdownButton<String>(
                hint: const Text('Select domain'),
                isExpanded: true,
                value: selectedDomain == null ?
                null : selectedDomain,

                items: emailDomains
                    .map(
                      (domain) => DropdownMenuItem(
                    value: domain,
                    child: Text(domain),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    final name = emailController.text.split('@').first;
                    emailController.text = '$name@$value';
                    selectedDomain = value;

                    emailError = validateEmail(emailController.text);

                  });
                },
              ),
              const SizedBox(height: 16),
            _buildInput(
              label: 'Password*',
              icon: Icons.lock_outline,
              controller: passwordController,
              obscure: obscurePassword,
              errorText: passwordError,
              onToggleVisibility: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              onChanged: (value) {
                setState(() {
                  passwordError = validatePassword(value);
                  confirmPasswordError = validateConfirmPassword(
                    confirmPasswordController.text,
                    value,
                  );
                });
              },
            ),
            const SizedBox(height: 16),

            _buildInput(
              label: 'Confirm password*',
              icon: Icons.lock_reset,
              controller: confirmPasswordController,
              obscure: obscureConfirmPassword,
              errorText: confirmPasswordError,
              onToggleVisibility: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              onChanged: (value) {
                setState(() {
                  confirmPasswordError =
                      validateConfirmPassword(value, passwordController.text);
                });
              },
            ),const SizedBox(height: 20),

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
    ),
    );
  }

  Widget _buildInput({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    String? errorText,
    VoidCallback? onToggleVisibility,
    Function(String)? onChanged,
  }) {
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

        TextField(
          controller: controller,
          obscureText: obscure,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFD3DEE9),

            prefixIcon: Icon(icon, color: const Color(0xFF0A5DBA)),

           suffixIcon: onToggleVisibility != null
                ? IconButton(
              icon: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF0A5DBA),
              ),
              onPressed: onToggleVisibility,
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

        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 8),
            child: Text(
              errorText,
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

  String? validateUsername(String value) {
    if (value.isEmpty) return 'Please Enter your Username!';
    if (value.length < 4) return 'Username must be at least 4 characters!';

    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'Username must contain at least one letter!';
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Only letters, numbers and underscore are allowed!';
    }

    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) return 'Please Enter your phone number!';
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Phone number must contain digits only!';
    }
    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }
    return null;
  }
  String? validateEmail(String value) {
    if (value.isEmpty) return 'Please Enter your Email!';

    if (!value.contains('@')) {
      return 'Invalid email format!';
    }

    final parts = value.split('@');//break String to p0,@,p21

     if (parts.length != 2) return 'Invalid email format!';

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(parts[0])) {
      return 'Invalid email username!';
    }
    return null;
  }
  String? validatePassword(String value) {
    if (value.length < 8) return 'Password must be at least 8 characters!';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Password must contain an uppercase letter!';
    if (!RegExp(r'[a-z]').hasMatch(value)) return 'Password must contain a lowercase letter!';
    if (!RegExp(r'\d').hasMatch(value)) return 'Password must contain a digit!';

    return null;
  }
  String? validateConfirmPassword(String value, String password) {
    if (value != password) return 'Passwords do not match!';
    return null;
  }
  bool shouldShowEmailDomainDropdown(String value) {
    if (!value.contains('@')) return false;

    final parts = value.split('@');
    if (parts.length != 2) return false;

    final typedDomain = parts[1];

    return typedDomain.isEmpty;

  }


}

