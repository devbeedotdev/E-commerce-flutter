import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/spacer.dart';

class SmallDisplay extends ConsumerWidget {
  final String title;
  final String image;
  const SmallDisplay({super.key, required this.image, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0x0D000000),
            borderRadius: BorderRadius.circular(8.r)),
        width: 71.h,
        height: 75.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/dress.png"),
            SpacerUtil.hspace(7.h),
            title.isEmpty
                ? Container()
                : Text(
                    "Dress",
                    style: Styles.smallText(),
                  )
          ],
        )),
      ),
    );
  }
}
