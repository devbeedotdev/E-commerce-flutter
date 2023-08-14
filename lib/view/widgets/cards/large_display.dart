import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';

class LargeDisplay extends ConsumerWidget {
  const LargeDisplay({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffEFEFF2),
            borderRadius: BorderRadius.circular(8.r)),
        width: 154.h,
        height: 190.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/shirt.png"),
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 98,
                      child: Text(
                        "Long Sleeeve Shirts",
                        style: Styles.smallText(),
                      )),
                  Text(
                    "\$165",
                    style: Styles.smallText(color: Colors.black),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
