import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/view/map-screen/map-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Params.height / 7,
            ),
            //logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Baxi',
                  style: GoogleFonts.poppins(
                      fontSize: 52, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  Assets.images.logo.path,
                  height: Params.height / 9,
                ),
              ],
            ),
            SizedBox(
              height: Params.height / 24,
            ),
            //enter
            Text(
              'ثبت نام',
              style: GoogleFonts.poppins(
                  fontSize: 36, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: Params.height / 28,
            ),
            //name text field
            Padding(
              padding: EdgeInsets.only(
                  left: Get.size.width / 10, right: Get.size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    hintText: 'نام',
                    hintStyle: GoogleFonts.poppins(
                        color: MyColor.prefixTextField, fontSize: 14),
                    contentPadding: const EdgeInsets.fromLTRB(0, 16, 24, 16)),
              ),
            ),
            SizedBox(
              height: Params.height / 48,
            ),
            // family name text field
            Padding(
              padding: EdgeInsets.only(
                  left: Get.size.width / 10, right: Get.size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    hintText: 'نام خانوادگی',
                    hintStyle: GoogleFonts.poppins(
                        color: MyColor.prefixTextField, fontSize: 14),
                    contentPadding: const EdgeInsets.fromLTRB(0, 16, 24, 16)),
              ),
            ),
            SizedBox(
              height: Params.height / 48,
            ),
            // sex text field
            Padding(
              padding: EdgeInsets.only(
                  left: Get.size.width / 10, right: Get.size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    hintText: 'جنسیت',
                    hintStyle: GoogleFonts.poppins(
                        color: MyColor.prefixTextField, fontSize: 14),
                    contentPadding: const EdgeInsets.fromLTRB(0, 16, 24, 16)),
              ),
            ),
            SizedBox(
              height: Params.height / 48,
            ),
            // email text field
            Padding(
              padding: EdgeInsets.only(
                  left: Get.size.width / 10, right: Get.size.width / 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: MyColor.borderTextField)),
                    hintText: 'ایمیل(اختیاری)',
                    hintStyle: GoogleFonts.poppins(
                        color: MyColor.prefixTextField, fontSize: 14),
                    contentPadding: const EdgeInsets.fromLTRB(0, 16, 24, 16)),
              ),
            ),
            SizedBox(
              height: Params.height / 48,
            ),
            //elevated button
            ElevatedButton(
                onPressed: () {
                  Get.to(const MapScreen());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyColor.primary),
                    fixedSize: MaterialStateProperty.all(
                        Size(Params.width / 1.22, Params.height / 16))),
                child: Text(
                  'ثبت نام',
                  style: GoogleFonts.poppins(
                      color: MyColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    ));
  }
}
