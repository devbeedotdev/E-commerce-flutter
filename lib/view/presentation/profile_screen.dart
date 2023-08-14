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
          mainAxisAlignment: MainAxisAlignment.center,
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
              "Lawal Damilare",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto"),
            ),
            SpacerUtil.hspace(4.h),
            Text(
              "alex@gmail.com",
              style: Styles.smallText(),
            )
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
      child: Column(
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
          Text(
            subtitle,
            style: Styles.smallText(),
          ),
        ],
      ),
    );
  }
}
