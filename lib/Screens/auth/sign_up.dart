import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

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
            )
            
          ],)),
    )
  }

}
