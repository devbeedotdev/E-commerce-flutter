import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/appformfield.dart';
import 'package:shopping_app/data/utils/spacer.dart';

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
          leading: Image.asset("assets/images/drawer.png"),
          title: Text(
            "15/2 New Texas",
            style: Styles.smallText(color: Colors.black),
          ),
          actions: [Image.asset("assets/images/notification.png")]),
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
                image: "Filter.png",
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
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
