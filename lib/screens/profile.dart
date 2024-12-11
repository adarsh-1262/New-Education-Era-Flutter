import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learnly/components/auth.dart';
import 'package:learnly/screens/coursescreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    
    final AuthService auth=AuthService();
    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: Text('Profile', style: TextStyle(fontSize: 20)),
        actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? Icons.light : Icons.dark_mode))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage('assets/images/logo.jpg'))),
                  ),
                  
                ],
              ),
              const SizedBox(height: 10),
              Container(width: MediaQuery.of(context).size.width,
              height: 40,
                decoration: BoxDecoration(color: Colors.orange[600]
                ,borderRadius: BorderRadius.circular(4)),
                child: Center(child: Text('Jeniffer Winget',style: TextStyle(fontSize: 20),)),),
                SizedBox(height: 5,),
              Container(
                width:MediaQuery.of(context).size.width,
                height: 40,
                child: Center(child: Text('xyz@gmail.com',style: TextStyle(fontSize: 20))),decoration: BoxDecoration(color: Colors.orange[600]
                ,borderRadius: BorderRadius.circular(4)),),
              //TextField(decoration: InputDecoration(helperText:'Enter name'),),
              //TextField(decoration: InputDecoration(helperText: 'Enter email'),),
              const SizedBox(height: 20),

              /// -- BUTTON
              
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Courses", onPress: () {Get.to(CourseSelectionPage());},textColor:Colors.white ,bgColor:Color.fromARGB(255, 61, 61, 63),),
              SizedBox(height: 10,),
              ProfileMenuWidget(title: "Attendance Overview", onPress: () {_dialogBuilder(context,'Attendance');},bgColor:Color.fromARGB(255, 61, 61, 63),),
              SizedBox(height: 10,),
            ProfileMenuWidget(title: "Marks", onPress: () {_dialogBuilder(context,'Marks');},bgColor:Color.fromARGB(255, 61, 61, 63),),
            SizedBox(height: 10,),
            ProfileMenuWidget(title: "Achievements and Badges", onPress: () {_dialogBuilder(context,'Achievements and Badges');},bgColor:Color.fromARGB(255, 61, 61, 63),),
              const Divider(),
              const SizedBox(height: 10),
              //ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(

                          onPressed: (){
                            auth.signOut();
                            Get.back();
                            Get.snackbar('Logged Out','you have been successfully logged out');
                            //Get.off();
                            } ,//AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }}





  
class ProfileMenuWidget extends StatelessWidget {
   ProfileMenuWidget({
    Key? key,
    required this.title,
     this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor, this.bgColor,
  }) : super(key: key);

  final String title;
   IconData? icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.grey[700] : Colors.white;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: bgColor,borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(16),
        child: Text(title,style: TextStyle(color: textColor,fontSize: 20),),
      ));
  }
}



    Future<void> _dialogBuilder(BuildContext context,String title) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: Column(
            children: [
              AnimatedTextKit(animatedTexts:[FlickerAnimatedText(title)]
              
              )
            ],
            
          ),
        );
      },
    );
  }


