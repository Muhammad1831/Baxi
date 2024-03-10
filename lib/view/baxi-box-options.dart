import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/view/map-screen/map-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BaxiBoxOptions extends StatelessWidget {
  BaxiBoxOptions({super.key});

  RxBool breakableSelected = false.obs;
  RxInt selected = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // back button & travel options
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'گزینه های سفر',
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
            const SizedBox(
              height: 32,
            ),
            // image
            Image.asset(
              Assets.images.baxiBox.path,
              height: 322,
            ),
            const SizedBox(
              height: 32,
            ),
            // breakable
            Padding(
              padding: EdgeInsets.only(
                  left: Params.bodyMargin * 1.5,
                  right: Params.bodyMargin * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.cube_box_fill,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'شکستنی',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Obx(
                    () => FlutterSwitch(
                      value: breakableSelected.value,
                      onToggle: (value) {
                        breakableSelected.value = value;
                      },
                      height: 20,
                      width: 30,
                      borderRadius: 50,
                      switchBorder: Border.all(color: MyColor.borderTextField),
                      toggleSize: 8,
                      activeToggleColor: Colors.white,
                      inactiveToggleColor: Colors.black,
                      activeColor: MyColor.primary,
                      inactiveColor: MyColor.greyBackGround,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 0.5,
              width: 350,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            // financial value of goods
            Padding(
              padding: EdgeInsets.only(
                  left: Params.bodyMargin * 1.5,
                  right: Params.bodyMargin * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.money_dollar_circle_fill,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'ارزش مالی کالا',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 28,
                        width: 120,
                        child: TextField(
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(9),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColor.primary)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MyColor.borderTextField))),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'تومان',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 0.5,
              width: 350,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            // weight value
            Padding(
              padding: EdgeInsets.only(
                  left: Params.bodyMargin * 1.5,
                  right: Params.bodyMargin * 1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.scale,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'وزن کالا',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 28,
                        width: 84,
                        child: TextField(
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColor.primary)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MyColor.borderTextField))),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'کیلوگرم',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            // travel cost
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 12, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'هزینه سفر',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '20000 تومان',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ), //elevated button
            ElevatedButton(
                onPressed: () {
                  // Get.to(PaymentOption());
                  Get.to(const MapScreen());
                  showModalBottomSheet(
                      barrierColor: Colors.transparent,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: Params.height / 2.5,
                          width: Params.width,
                          decoration: const BoxDecoration(
                            color: MyColor.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.images.searchForBaxi.path,
                                height: 150,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(
                                height: 6,
                                width: Params.width / 1.2,
                                decoration: BoxDecoration(
                                    color: MyColor.primary,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'در حال یافتن نزدیک ترین بکسی به شما لطفا صبور باشید.',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              //elevated button
                              ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              MyColor.primary),
                                      fixedSize: MaterialStateProperty.all(Size(
                                          Params.width / 1.22,
                                          Params.height / 16))),
                                  child: Text(
                                    'لغو سفر',
                                    style: GoogleFonts.poppins(
                                        color: MyColor.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        );
                      });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyColor.primary),
                    fixedSize: MaterialStateProperty.all(
                        Size(Params.width / 1.22, Params.height / 16))),
                child: Text(
                  'درخواست بکسی',
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
