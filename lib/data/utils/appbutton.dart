import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends ConsumerWidget {
  final bool isLarge;
  final String title;
  final Function()? function;
  const AppButton(
      {required this.title,
      required this.function,
      required this.isLarge,
      super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffF67952),
            minimumSize: isLarge ? Size(253.w, 55.h) : Size(205.w, 59.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90.r))),
        onPressed: function,
        child: Text(title));
  }
}
