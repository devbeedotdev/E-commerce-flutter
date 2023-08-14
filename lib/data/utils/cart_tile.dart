import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:shopping_app/view/cart_screen.dart';
import 'package:shopping_app/view/home_screen.dart';

class CartTile extends ConsumerWidget {
  const CartTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ListTile(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none),
          tileColor: const Color(0xffFFFFFF),
          leading: const SmallDisplay(title: "", image: ""),
          title: const Text("Henley Shirts"),
          subtitle: const Text("\$250"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconBox(
                  function: () {},
                  child: const Icon(
                      size: 12, Icons.remove, color: Color(0xffF67952))),
              SpacerUtil.wspace(10.w),
              const Text("1"),
              SpacerUtil.wspace(10.w),
              IconBox(
                  function: () {},
                  child: const Icon(
                      size: 12, Icons.add, color: Color(0xffF67952))),
            ],
          )),
    );
  }
}
