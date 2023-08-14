import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/view/widgets/appformfield.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:shopping_app/view/widgets/cards/large_display.dart';
import 'package:shopping_app/view/widgets/cards/small_display.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 28, height: 16, "assets/images/drawer.png"),
            ],
          ),
          title: Text(
            "15/2 New Texas",
            style: Styles.smallText(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(IconlyBold.notification,
                          color: Colors.grey)),
                ],
              ),
            )
          ]),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Explore",
              style: Styles.largeText(),
            ),
            SpacerUtil.hspace(13.h),
            Text(
              "best Outfits for you",
              style: Styles.mediumText(color: Colors.grey),
            ),
            SpacerUtil.hspace(23.h),
            const SearchAppFormField(
                title: "Search Items",
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
            SpacerUtil.hspace(35.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5,
                    (index) => const SmallDisplay(title: "Dress", image: "")),
              ),
            ),
            SpacerUtil.hspace(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrival",
                  style: Styles.mediumText(),
                ),
                Text(
                  "See All",
                  style: Styles.smallText(),
                )
              ],
            ),
            SpacerUtil.hspace(17.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) => const LargeDisplay()),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
