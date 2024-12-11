import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnly/components/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnly/components/auth.dart';
import 'package:learnly/screens/coursescreen.dart';
import 'home.dart';
import "register.dart";


import 'package:flutter/material.dart';

import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 1,
          child: Container(height: MediaQuery.of(context).size.height/3,
            child: Center(child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Card(elevation: 10,
            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
              child: Container(child: Image.asset('assets/images/logo.jpg',scale: 3,))),
            AnimatedTextKit(animatedTexts: [TypewriterAnimatedText('Learnly',textStyle:TextStyle(fontSize: 48,fontWeight:FontWeight.bold))],),
          ],
        )),
          decoration:BoxDecoration(gradient:LinearGradient(colors: [Colors.pink,Colors.orange,Colors.red])) ,
          ),),
        SizedBox(height: 30,),
        TextField(controller: email,
          decoration: InputDecoration(labelText: 'Enter Email',border: OutlineInputBorder()
        )),
        SizedBox(height: 30,),
        TextField(controller: password,
        obscureText: true,
          decoration: InputDecoration(labelText: 'Enter Password',border: OutlineInputBorder())),
        SizedBox(height: 20,),
        Button(name:'Login',onTap: ()async{
        try {final user = await authService.signIn(
                  email.text,
                  password.text,
                );
                if (user != null) {
                  print("Sign-up successful: ${user.email}");
                  Get.to(Home());
                }} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }}},color: Color.fromARGB(255, 33, 200, 21),),

         
        SizedBox(height:10 ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Need to Register ?'),
            SizedBox(width: 20,),
            InkWell(child: Text('Register',style: TextStyle(
              color: Colors.red
            ),),onTap: (){Get.to(RegisterScreen());},)
          ],
        )
      
      ],),
    );
  }


  
}

class Button extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final Color color;
  Button({required this.name,required this.onTap,required this.color});
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
  onTap:
    onTap
    
  ,
  borderRadius: BorderRadius.circular(8), // Optional for rounded corners
  child: Container(
    width: 4*50,
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Adjust padding
    decoration: BoxDecoration(
      color: color, // Background color
      borderRadius: BorderRadius.circular(8), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          blurRadius: 4, // Blur effect
          offset: Offset(2, 2), // Shadow position
        ),
      ],
    ),
    child: Center(
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)
;
  }
}