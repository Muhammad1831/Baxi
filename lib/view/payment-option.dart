import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/view/score-driver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PaymentOption extends StatelessWidget {
  PaymentOption({super.key});

  RxBool walletSelected = false.obs;
  RxBool onlineSelected = false.obs;
  RxBool cashSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Params.bodyMargin, right: Params.bodyMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // back button & peyment options
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'روش های پرداخت',
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
                              border:
                                  Border.all(color: MyColor.borderTextField)),
                          child: const Center(
                              child: Icon(Icons.arrow_forward_ios)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // choose payment option
                Text(
                  'روش پرداخت را انتخاب کنید',
                  style: GoogleFonts.poppins(
                      color: MyColor.titleGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 48,
                ),
                // wallet
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.wallet,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'کیف پول',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Obx(
                      () => FlutterSwitch(
                        value: walletSelected.value,
                        onToggle: (value) {
                          if (onlineSelected.value == false &&
                              cashSelected.value == false) {
                            walletSelected.value = value;
                          }
                        },
                        height: 20,
                        width: 30,
                        borderRadius: 50,
                        switchBorder:
                            Border.all(color: MyColor.borderTextField),
                        toggleSize: 8,
                        activeToggleColor: Colors.white,
                        inactiveToggleColor: Colors.black,
                        activeColor: MyColor.primary,
                        inactiveColor: MyColor.greyBackGround,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                const SizedBox(
                  height: 24,
                ),
                // online
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Hicons.card_2_bold,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'آنلاین',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Obx(
                      () => FlutterSwitch(
                        value: onlineSelected.value,
                        onToggle: (value) {
                          if (walletSelected.value == false &&
                              cashSelected.value == false) {
                            onlineSelected.value = value;
                          }
                        },
                        height: 20,
                        width: 30,
                        borderRadius: 50,
                        switchBorder:
                            Border.all(color: MyColor.borderTextField),
                        toggleSize: 8,
                        activeToggleColor: Colors.white,
                        inactiveToggleColor: Colors.black,
                        activeColor: MyColor.primary,
                        inactiveColor: MyColor.greyBackGround,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                const SizedBox(
                  height: 24,
                ),
                // cash
                Row(
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
                          'نقدی',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Obx(
                      () => FlutterSwitch(
                        value: cashSelected.value,
                        onToggle: (value) {
                          if (onlineSelected.value == false &&
                              walletSelected.value == false) {
                            cashSelected.value = value;
                          }
                        },
                        height: 20,
                        width: 30,
                        borderRadius: 50,
                        switchBorder:
                            Border.all(color: MyColor.borderTextField),
                        toggleSize: 8,
                        activeToggleColor: Colors.white,
                        inactiveToggleColor: Colors.black,
                        activeColor: MyColor.primary,
                        inactiveColor: MyColor.greyBackGround,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Params.height / 3.2,
          ),
          Container(
            height: 0.5,
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Params.bodyMargin, right: Params.bodyMargin),
            child: Column(
              children: [
                // cost of travel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'هزینه سفر',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('28000 تومان',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                // wallet balance
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'موجودی کیف پول',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('0 تومان',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                // desired inventory
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'موجودی مورد نیاز',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('28000 تومان',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                //elevated button
                ElevatedButton(
                    onPressed: () {
                      Get.to(const ScoreDriver());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyColor.primary),
                        fixedSize: MaterialStateProperty.all(
                            Size(Params.width / 1.22, Params.height / 16))),
                    child: Text(
                      'پرداخت',
                      style: GoogleFonts.poppins(
                          color: MyColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
