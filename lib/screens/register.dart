import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnly/components/auth.dart';
import 'package:learnly/screens/userScreen.dart';
import 'home.dart';
import 'login.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  TextEditingController emailC=TextEditingController();
  TextEditingController passwordC=TextEditingController();
  TextEditingController passwordC2=TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 1,
          child: Container(child: Center(child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Card(elevation: 7,
            shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
              child: Container(child: Image.asset('assets/images/logo.jpg',scale: 3,))),
            AnimatedTextKit(animatedTexts: [TypewriterAnimatedText('Learnly',textStyle:TextStyle(fontSize: 48,fontWeight:FontWeight.bold),cursor: '|')],),
          ],
        )),
          decoration:BoxDecoration(gradient:LinearGradient(colors: [Colors.blue,Colors.green,Colors.yellow])) ,),),
        SizedBox(height: 20,),
        TextField(controller: emailC,
          decoration: InputDecoration(labelText: 'Enter Email',border: OutlineInputBorder()
        )),
        SizedBox(height: 20,),
        TextField(controller: passwordC,
        obscureText: false,
          decoration: InputDecoration(labelText: 'Enter Password',border: OutlineInputBorder())),
          SizedBox(height: 15,),
        TextField(controller: passwordC2,
        obscureText: true,
          decoration: InputDecoration(labelText: 'Confirm Password',border: OutlineInputBorder())),
        SizedBox(height: 20,),
        Button(color: Colors.green,
          name:'Register',onTap: ()async{
          try {
            if(emailC.text!=null && passwordC.text != null && passwordC2.text==passwordC.text){
  final credential = await authService.signUp(
    emailC.text,
     passwordC.text,
  );
  print(emailC.text);
  Get.to(UserScreen());
}} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    Get.snackbar('Password Error','Password is too weak');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    Get.snackbar('Account already exists with this email','');
  }
} catch (e) {
  print(e);
  Get.snackbar('Some error Occured','Kindly try login again');
}}),
    
        SizedBox(height:10 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have account ?'),
            SizedBox(width: 10,),
            InkWell(child: Text('Login',style: TextStyle(
              color: Colors.red
            ),),onTap: (){Get.back();},)
          ],
        )
      
      ],),
    );
  }


  
}


