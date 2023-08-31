import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/spacer.dart';

class SmallDisplay extends ConsumerWidget {
  final Function()? function;
  final String title;
  final String image;
  const SmallDisplay(
      {super.key,
      required this.image,
      required this.title,
      required this.function});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          width: 71.h,
          height: 75.h,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(image, width: 27.w, height: 37.h),
              SpacerUtil.hspace(7.h),
              title.isEmpty
                  ? Container()
                  : Text(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      title,
                      style: Styles.smallText(),
                    )
            ],
          )),
        ),
      ),
    );
  }
}
