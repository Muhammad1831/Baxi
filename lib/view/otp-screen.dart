import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          // back icon
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: Params.height / 20,
                  width: Params.height / 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MyColor.borderTextField)),
                  child: const Center(child: Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Params.height / 6,
          ),
          // enter verify code
          Text(
            'کد تایید را وارد کنید',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 8,
          ),
          // sent code to
          Text('کد ارسال شد به  09016981979',
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.normal)),
          const SizedBox(
            height: 52,
          ),
          // 4 text fields
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 66,
                width: 66,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context)
                          .focusInDirection(TraversalDirection.right);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: MyColor.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 66,
                width: 66,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context)
                          .focusInDirection(TraversalDirection.right);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: MyColor.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 66,
                width: 66,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context)
                          .focusInDirection(TraversalDirection.right);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: MyColor.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 66,
                width: 66,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context)
                          .focusInDirection(TraversalDirection.right);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: MyColor.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          // send again & not recive code
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'کدی دریافت نکردید؟',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 24,
                  width: 88,
                  child: Text(
                    '  ارسال دوباره',
                    style: GoogleFonts.poppins(
                        color: MyColor.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 54,
          ),
          // elevated button
          ElevatedButton(
              onPressed: () {
                Get.to(const SignUp());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColor.primary),
                  fixedSize: MaterialStateProperty.all(
                      Size(Params.width / 1.22, Params.height / 16))),
              child: Text(
                'تایید',
                style: GoogleFonts.poppins(
                    color: MyColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    ));
  }
}
