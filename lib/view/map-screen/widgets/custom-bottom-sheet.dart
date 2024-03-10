import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/view/baxi-bar-options.dart';
import 'package:baxi/view/baxi-box-options.dart';
import 'package:baxi/view/baxi-options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseBaxiServiceBottomSheet extends StatelessWidget {
  const ChooseBaxiServiceBottomSheet({
    super.key,
    required this.selected,
  });

  final RxInt selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Params.height / 2,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: Column(children: [
        const SizedBox(
          height: 24,
        ),
        // baxi container
        GestureDetector(
          onTap: () {
            selected.value = 1;
          },
          child: Obx(
            () => Container(
              height: 65,
              width: 380,
              decoration: BoxDecoration(
                  color: selected == 1 ? MyColor.greyBackGround : MyColor.white,
                  border: Border.all(color: MyColor.borderTextField),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '20000 تومان',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'بکسی',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  Image.asset(
                    Assets.images.baxiCar.path,
                    height: 60,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // baxi women container
        GestureDetector(
          onTap: () {
            selected.value = 2;
          },
          child: Obx(
            () => Container(
              height: 65,
              width: 380,
              decoration: BoxDecoration(
                  color: selected == 2 ? MyColor.greyBackGround : MyColor.white,
                  border: Border.all(color: MyColor.borderTextField),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '25000 تومان',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'بکسی بانوان',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  Image.asset(Assets.images.baxiWomen.path, height: 48)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // baxi box container
        GestureDetector(
          onTap: () {
            selected.value = 3;
          },
          child: Obx(
            () => Container(
              height: 65,
              width: 380,
              decoration: BoxDecoration(
                  color: selected == 3 ? MyColor.greyBackGround : MyColor.white,
                  border: Border.all(color: MyColor.borderTextField),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '12000 تومان',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'بکسی باکس',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  Image.asset(Assets.images.baxiBox.path, height: 54)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // baxi bar container
        GestureDetector(
          onTap: () {
            selected.value = 4;
          },
          child: Obx(
            () => Container(
              height: 65,
              width: 380,
              decoration: BoxDecoration(
                  color: selected.value == 4
                      ? MyColor.greyBackGround
                      : MyColor.white,
                  border: Border.all(color: MyColor.borderTextField),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '45000 تومان',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'بکسی بار',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  Image.asset(Assets.images.baxiBar.path, height: 60)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //elevated button
        ElevatedButton(
            onPressed: () {
              switch (selected.value) {
                case 1:
                  Get.to(BaxiOptions());
                  break;
                case 2:
                  Get.to(BaxiOptions());
                  break;
                case 3:
                  Get.to(BaxiBoxOptions());
                  break;
                case 4:
                  Get.to(BaxiBarOptions());
                  break;
                default:
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyColor.primary),
                fixedSize: MaterialStateProperty.all(
                    Size(Params.width / 1.22, Params.height / 16))),
            child: Text(
              'انتخاب سرویس',
              style: GoogleFonts.poppins(
                  color: MyColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}
