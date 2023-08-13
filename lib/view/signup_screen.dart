import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/appformfield.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:shopping_app/view/dashboard_screen.dart';
import 'package:shopping_app/view/login_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final isCheckedProvider = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(
              left: 20.w, top: 20.h, right: 20.w, bottom: 66.18.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                    width: 54, height: 62, "assets/images/app_logo.png"),
                SpacerUtil.hspace(20.h),
                Text(
                  "Sign Up",
                  style: Styles.mediumText(),
                ),
                SpacerUtil.hspace(33.h),
                const AppFormField(
                  image: "Profile.png",
                  title: "Name",
                ),
                SpacerUtil.hspace(16.h),
                const AppFormField(
                  image: "Message.png",
                  title: "Email",
                ),
                SpacerUtil.hspace(16.h),
                const AppFormField(
                  image: "Lock.png",
                  title: "Password",
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                          activeColor: const Color(0xffF67952),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r)),
                          value: ref.watch(isCheckedProvider),
                          onChanged: (value) {
                            ref.read(isCheckedProvider.notifier).state =
                                value as bool;
                          }),
                    ),
                    RichText(
                        text: TextSpan(
                      style: Styles.smallText(color: Colors.grey),
                      children: <TextSpan>[
                        const TextSpan(text: "I accept to all the "),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Terms & Condition',
                          style:
                              Styles.smallText(color: const Color(0xff230a06)),
                        ),
                      ],
                    )),
                  ],
                ),
                AppButton(
                    title: "Sign Up",
                    function: ref.watch(isCheckedProvider)
                        ? () {
                            Get.to(() => const DashBoardScreen());
                          }
                        : null,
                    isLarge: false),
                SpacerUtil.hspace(50.h),
                SizedBox(
                  width: 200.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, right: 15.w),
                        child: const Text("Or"),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SpacerUtil.hspace(43.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        width: 70.88,
                        height: 70.88,
                        "assets/images/fb_logo.png"),
                    Image.asset(
                        width: 70.88,
                        height: 70.88,
                        "assets/images/google_logo.png")
                  ],
                ),
                SpacerUtil.hspace(10.h),
                RichText(
                    text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                      text: 'Log In',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
