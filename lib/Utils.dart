import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scan/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  // show Toast
  static void showGetXToast({required String title, required String message}) {
    Fluttertoast.showToast(msg: title);
    // Get.snackbar(title, message,
    //     snackPosition: SnackPosition.TOP,
    //     backgroundGradient: const LinearGradient(
    //       colors: [WebXConfig.primaryColor, WebXConfig.secondaryColor],
    //     ),
    //     colorText: Colors.white,
    //     margin: const EdgeInsets.all(10),
    //     borderRadius: 10,
    //     snackStyle: SnackStyle.FLOATING,
    //     animationDuration: const Duration(milliseconds: 500),
    //     forwardAnimationCurve: Curves.easeIn,
    //     reverseAnimationCurve: Curves.easeOut);
  }

  //
  /*
  String getImageUrl(String imageUrl) {
    return imageUrl.contains("http")
        ? imageUrl
        : ApiRoutes().imageUrl + imageUrl;
  }*/

  //
  // file to qr text
  Future<String> fileToQrText(File file) async {
    String? result = await Scan.parse(file.path);
    return result ?? '';
  }

  // get upi://pay?pa=khans01@paytm&pn=PaytmUser&mc=0000&mode=02&purpose=00&orgid=159761&cust=1242348780
  // pa FROM QR CODE
  

  static void showToast({required String message}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      webPosition: "center",
      gravity: ToastGravity.TOP,
      webBgColor: "linear-gradient(to right, #0E7CF4, #04419E)",
    );
  }

  // Store Setting Data Save
  static Future<void> saveStoreSettingsToPrefs(
      Map<String, dynamic> settingsData) async {
    final prefs = await SharedPreferences.getInstance();
    String settingsJson = jsonEncode(settingsData);
    await prefs.setString('printerSettings', settingsJson);
  }

  // load Store Setting Data
  static Future<Map<String, dynamic>?> loadStoreSettingsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('printerSettings')) {
      String settingsJson = prefs.getString('printerSettings')!;
      Map<String, dynamic> settingsData = jsonDecode(settingsJson);
      print("settingsDataSharedPref: $settingsData");
      return settingsData;
    }
    return null;
  }

  // Invoice selection color
  static Future<void> saveSelectedColor(String colorCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedColorCode', colorCode);
    print("Invoice Saved Color: ${prefs.toString()}");
  }

  // Invoice get saved color
 

  // format currency
  

  // open whatsapp
  static launchWhatsapp(String mobile, String message) async {
    // check if  whatsapp & whatsapp business is installed or not
    // if (await canLaunchUrl(Uri.parse("whatsapp://send?phone=$mobile"))) {
    //   await canLaunchUrl(
    //       Uri.parse("whatsapp://send?phone=$mobile&text=$message"));
    // } else {
    //   if (await canLaunchUrl(
    //       Uri.parse("https://api.whatsapp.com/send?phone=$mobile"))) {
    //     await canLaunchUrl(Uri.parse(
    //         "https://api.whatsapp.com/send?phone=$mobile&text=$message"));
    //   } else {
    //     showToast(message: "Whatsapp not installed");
    //   }
    // }

    print("mobile: $mobile");

    // format mobile number
    mobile = mobile.replaceAll("+", "").replaceAll(" ", "");
    print("mobile: $mobile");
    //https://api.whatsapp.com/send/?phone=917417391228&text&type=phone_number&app_absent=0
    var iosUrl = "https://api.whatsapp.com/send/?phone=$mobile&text=$message"
        "&type=phone_number&app_absent=0";
    print("androidUrl: $iosUrl");
    print("iosUrl: $iosUrl");
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(iosUrl));
      }
    } on Exception {
      showToast(message: "Whatsapp not installed");
    }
  }

  // open whatsapp without mobile number
  static launchWhatsappWithoutMobile(String message) async {
    // var androidUrl = "https://wa.me/?text=$message";
    // var iosUrl = "https://wa.me/?text=$message";
    var iosUrl = "https://api.whatsapp.com/send?text=$message";
    var androidUrl = "https://api.whatsapp.com/send?text=$message";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      showToast(message: "Whatsapp not installed");
    }
  }

  // get random color
  static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }


  static Map<String, dynamic> assignedPermissions = {};

  /*static checkForPermission(
      {required String permission, required String type}) {
    print("user type");
    print(permission);
    print(type);
    print(WebXConfig.userType);
    if (WebXConfig.userType == "STAFF") {
      return checkAssignedPermission(permission: permission, type: type);
    } else if (WebXConfig.userType == "MANAGER") {
      return checkAssignedPermission(permission: permission, type: type);
    } else {
      return true;
    }
  }*/

 

  // staff permission feature
  static bool checkAssignedPermission(
      {required String permission, required String type}) {
    print("assignedPermissions");
    print(assignedPermissions);
    if (assignedPermissions.isEmpty) {
      return false;
    }
    if (assignedPermissions[permission] == null) {
      return false;
    }
    if (assignedPermissions[permission]![type] == null) {
      return false;
    }
    return assignedPermissions[permission]?[type] ?? false;
  }

  // show loading
  static void showLoading() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          //color: WebXConfig.primaryColor,
        ),
      ),
      barrierDismissible: false,
    );
  }

  // hide loading
  static void hideLoading() {
    Get.back();
  }

  static String convertToPercentage(
      {required String discount, required String price}) {
    // discount is in value
    // price is in value
    double discountValue = double.tryParse(discount) ?? 0;
    double priceValue = double.tryParse(price) ?? 0;
    double percentage = (discountValue / priceValue) * 100;
    return percentage.toStringAsFixed(2);
  }

  static String convertToAmount(
      {required String discountPercentage, required String price}) {
    // discount is in percentage
    // price is in value
    double discountPercentageValue = double.tryParse(discountPercentage) ?? 0;
    double priceValue = double.tryParse(price) ?? 0;
    double amount = (discountPercentageValue / 100) * priceValue;
    // amount = priceValue - amount;
    return amount.toStringAsFixed(2);
  }

  // calculate discount price
  static double calculateDiscountPrice(
      {required String price,
      required String discount,
      required String discountType}) {
    double priceValue = double.tryParse(price) ?? 0;
    double discountValue = double.tryParse(discount) ?? 0;
    double discountPrice = priceValue;
    if (discountType == "percentage") {
      discountPrice = ((discountValue / 100) * priceValue);
    } else {
      discountPrice = (discountValue);
    }
    return discountPrice;
  }

  static calculateTotalPrice(
      {required String price,
      required String discount,
      required String discountType,
      required int quantity}) {
    double priceValue = double.tryParse(price) ?? 0;
    double discountValue = double.tryParse(discount) ?? 0;
    double totalPrice = priceValue;
    print("calculate total price");
    print(discountType);
    print(discountValue);
    print(priceValue);
    if (discountType == "percentage") {
      totalPrice =
          (priceValue - ((discountValue / 100) * priceValue)) * quantity;
    } else {
      totalPrice = (priceValue - (discountValue)) * quantity;
    }
    print("totalPrice");
    print(totalPrice);
    return totalPrice.toStringAsFixed(2);
  }
/*
  static Future<XFile> createFile(String s, Uint8List uint8list) async {
    Uint8List imageInUnit8List = uint8list;
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/$s.png').create();
    file.writeAsBytesSync(imageInUnit8List);
    return XFile(file.path);
  }

  // share files
  static Future<void> shareFile(File file, String subject, String text) async {
    final bytes = await file.readAsBytes();
    final directory = await getTemporaryDirectory();
    final pathOfImage =
        await File('${directory.path}/${file.path.split("/").last}').create();
    final image = await pathOfImage.writeAsBytes(bytes);
    final status = await PermissionUtils.requestStoragePermission();
    if (status) {
      await Share.shareXFiles(
        [XFile(image.path)],
        subject: subject,
        text: text,
      );
    } else {
      await PermissionUtils.requestStoragePermission();
    }
  }*/

  // share files on whatsapp
  /*static Future<void> shareFileWhatsapp(
      File file, String subject, String text) async {
    final bytes = await file.readAsBytes();
    final directory = await getTemporaryDirectory();
    final pathOfImage = await File(
            '${directory.path}/${file.path.split("/").last.removeAllWhitespace}')
        .create();
    final image = await pathOfImage.writeAsBytes(bytes);
    final status = await PermissionUtils.requestStoragePermission();
    if (status) {
      // upload file
      try {
        FileUploadRepo fileUploadRepo = FileUploadRepo();
        String url = await fileUploadRepo.uploadFile(image);
        var subject =
            "I am facing issue in uploading file ! Find the file here : $url";
        print("url");
        Utils.launchWhatsapp(WebXConfig.supportPhone, subject);
      } catch (e) {
        print("error");
        print(e);
        var subject = "Error in uploading file !";
        Utils.launchWhatsapp(WebXConfig.supportPhone, subject);
      }

      // var flutterShareMe = FlutterShareMe();
      // flutterShareMe
      //     .shareToWhatsApp(
      //   msg: subject,
      //   imagePath: image.path,
      // )
      //     .then((value) {
      //   print("value");
      //   print(value);
      // }).catchError((error) {
      //   print("error");
      //   print(error);
      // });
    } else {
      await PermissionUtils.requestStoragePermission();
    }
  }*/
}
