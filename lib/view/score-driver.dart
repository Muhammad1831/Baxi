import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/view/map-screen/map-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreDriver extends StatelessWidget {
  const ScoreDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: Params.height,
            width: Params.width,
          ),
          // back button & score to driver
          Padding(
            padding: EdgeInsets.only(
                top: 16, left: Params.bodyMargin, right: Params.bodyMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'امتیاز به راننده',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Params.height / 20,
                    width: Params.height / 20,
                    decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: MyColor.borderTextField)),
                    child: const Center(child: Icon(Icons.arrow_forward_ios)),
                  ),
                ),
              ],
            ),
          ),
          // white container
          Positioned(
            top: 160,
            child: Container(
              height: 500,
              width: 360,
              decoration: BoxDecoration(
                  color: MyColor.containerBackGround,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: MyColor.greyBackGround,
                        blurRadius: 6,
                        spreadRadius: 4)
                  ]),
            ),
          ),
          Positioned(
            top: 120,
            child: Column(
              children: [
                // avatar
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(Assets.images.avatar.path))),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'امیر رضا منصور',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'به این سفر چه امتیازی می دی؟',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 48,
                ),
                // text field
                SizedBox(
                  width: 320,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: 'ثبت تخلف...',
                        hintStyle: GoogleFonts.poppins(fontSize: 16),
                        filled: true,
                        fillColor: MyColor.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.primary),
                            borderRadius: BorderRadius.circular(24)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: MyColor.borderTextField),
                            borderRadius: BorderRadius.circular(24))),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                //elevated button
                ElevatedButton(
                    onPressed: () {
                      Get.to(const MapScreen());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyColor.primary),
                        fixedSize: MaterialStateProperty.all(
                            Size(Params.width / 1.22, Params.height / 16))),
                    child: Text(
                      'ارسال نظر',
                      style: GoogleFonts.poppins(
                          color: MyColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
