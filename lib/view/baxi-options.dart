import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/view/map-screen/map-screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BaxiOptions extends StatelessWidget {
  BaxiOptions({super.key});

  RxBool onOff = false.obs;
  late RxString selectedDelayTime;
  RxList<String> delayTime =
      ['0 تا 5 دقیقه', '5 تا 10 دقیقه', '10 تا 30 دقیقه', '0 تا 60 دقیقه'].obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
            height: 48,
          ),
          // image
          Image.asset(
            Assets.images.baxi.path,
            height: 322,
          ),
          const SizedBox(
            height: 48,
          ),
          // go and back option
          Padding(
            padding: EdgeInsets.only(
                left: Params.bodyMargin * 1.5, right: Params.bodyMargin * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Hicons.arrow_swap_horizontal_bold,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'رفت و برگشت',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Obx(
                  () => FlutterSwitch(
                    value: onOff.value,
                    onToggle: (value) {
                      onOff.value = value;
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
            height: 16,
          ),
          Container(
            height: 0.5,
            width: 350,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          // many destinations option
          Padding(
            padding: EdgeInsets.only(
                left: Params.bodyMargin * 1.5, right: Params.bodyMargin * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Hicons.location_light_outline,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'چند مقصده',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Icon(
                  CupertinoIcons.forward,
                  size: 24,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 0.2,
            width: 350,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          // delay time option
          Padding(
            padding: EdgeInsets.only(
                left: Params.bodyMargin * 1.5, right: Params.bodyMargin * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.clock,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'زمان تاخیر',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Obx(
                  () => DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text('انتخاب زمان تاخیر',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                    ),
                    items: delayTime
                        .map((element) => DropdownMenuItem<String>(
                              value: element,
                              child: Text(
                                element,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      selectedDelayTime.value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 32,
                        width: 140,
                        decoration: BoxDecoration(
                            border: Border.all(color: MyColor.borderTextField),
                            borderRadius: BorderRadius.circular(8))),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 32,
                    ),
                    underline: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.yellow),
                  )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 48,
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
                Get.to(const MapScreen());
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
    ));
  }
}
