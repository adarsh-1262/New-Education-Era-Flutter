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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
            Padding( 
			padding: const EdgeInsets.only(top: 110.0), 
			child: Center( 
				child: Container( 
					width: 200, 
					height: 160, 
					decoration: BoxDecoration( 
						color: Colors.red, 
						borderRadius: BorderRadius.circular(10.0)),
					child: Image.asset('assets/images/learnly.png')
          ), 
			), 
      
			), 
            SizedBox(height:100,),
            
            TextField(controller: email,
              decoration: InputDecoration(labelText: 'Enter Email',border: OutlineInputBorder(),hintText: 'xyz@gmail.com'
            )),
            SizedBox(height: 30,),
            TextField(controller: password,
            obscureText: true,
              decoration: InputDecoration(labelText: 'Enter Password',border: OutlineInputBorder(),hintText: 'atleast 6 characters')),
            SizedBox(height: 20,),
            Button(name:'Login',onTap: ()async{
            try {final user = await authService.signIn(
                      email.text,
                      password.text,
                    );
                    if (user != null) {
                      print("Sign-In successful: ${user.email}");
                      Get.snackbar('Login Successful',"",dismissDirection: DismissDirection.horizontal);
                       Get.to(Home());
                    }} on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
              Get.snackbar('No user found with provided email',"");
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
          Get.snackbar('No user found with provided email',"");
            }
            }
            catch(e){Get.snackbar('Some Error Occured' ,e.toString());}
            },color: Color.fromARGB(255, 33, 200, 21),),
          
             
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
        ),
      ),
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