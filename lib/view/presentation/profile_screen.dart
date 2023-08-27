import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/spacer.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Styles.mediumText(),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0.h),
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage:
                      const AssetImage("assets/images/user_pix.png"),
                ),
              ],
            ),
            SpacerUtil.hspace(13.h),
            Text(
              "fkdjhfk",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto"),
            ),
            SpacerUtil.hspace(4.h),
            Text(
              "xvjkjdsksjv",
              style: Styles.smallText(),
            ),
            SpacerUtil.hspace(25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  3,
                  (index) => const MediumDisplay(
                      icon: Text(""),
                      title: "Progress Order",
                      subtitle: "10+")),
            ),
            SpacerUtil.hspace(25.h),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Personal Information",
                    style: Styles.mediumText(),
                  ),
                ],
              ),
            ),
            SpacerUtil.hspace(14.h),
            const UserDetailCard()
          ],
        ),
      ),
    );
  }
}

class UserDetailCard extends ConsumerStatefulWidget {
  const UserDetailCard({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserDetailCardState();
}

class _UserDetailCardState extends ConsumerState<UserDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 334.w,
      height: 195.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.0.h,
          right: 10.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name:",
                  style: Styles.smallText(),
                ),
                const Text(
                  "sff",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email:",
                  style: Styles.smallText(),
                ),
                const Text(
                  "vdvjd",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location", style: Styles.smallText()),
                const Text(
                  "fdjfkjf",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Zip Code",
                  style: Styles.smallText(),
                ),
                const Text("fjkfjc")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone",
                  style: Styles.smallText(),
                ),
                const Text("ffvjkjv")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MediumDisplay extends ConsumerWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  const MediumDisplay(
      {required this.icon,
      required this.title,
      required this.subtitle,
      super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 106.w,
      height: 117.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0x12F67952),
                borderRadius: BorderRadius.circular(100.r)),
            child: const Icon(IconlyLight.bag),
          ),
          Text(
            title,
            style: Styles.smallText(),
          ),
          Text(subtitle,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto")),
        ],
      ),
    );
  }
}
