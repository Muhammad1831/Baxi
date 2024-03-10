import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/view/otp-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Params.height / 6,
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
                height: Params.height / 16,
              ),
              //enter
              Text(
                'ورود',
                style: GoogleFonts.poppins(
                    fontSize: 36, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: Params.height / 16,
              ),
              //enter number
              Text(
                'شماره موبایل خود را وارد کنید',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Params.height / 48,
              ),
              //textfield
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
                      hintText: 'شماره همراه',
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
                    Get.to(const OtpScreen());
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyColor.primary),
                      fixedSize: MaterialStateProperty.all(
                          Size(Params.width / 1.22, Params.height / 16))),
                  child: Text(
                    'ارسال کد',
                    style: GoogleFonts.poppins(
                        color: MyColor.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
