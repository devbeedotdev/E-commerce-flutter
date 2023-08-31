import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/provider/category/category_provider.dart';

class LargeDisplay extends ConsumerWidget {
  final int index;
  final Function()? function;
  const LargeDisplay({super.key, required this.index, required this.function});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryVm = ref.watch(categoryViewModel).fewProductData.data!;
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          width: 154.h,
          height: 190.h,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 99.w,
                  height: 132.0.h,
                  child: Image.network(categoryVm[index]["image"])),
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 5.w, right: 7.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 98,
                        child: Text(
                          categoryVm[index]["title"],
                          maxLines: 2,
                          style: Styles.smallText(),
                        )),
                    Text(
                      "\$${categoryVm[index]["price"]}",
                      style: Styles.smallText(color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
