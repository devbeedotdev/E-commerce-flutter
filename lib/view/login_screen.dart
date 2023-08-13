import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/appformfield.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:shopping_app/view/dashboard_screen.dart';
import 'package:shopping_app/view/signup_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
                  "Log in",
                  style: Styles.mediumText(),
                ),
                SpacerUtil.hspace(33.h),
                const AppFormField(
                  image: "Message.png",
                  title: "Email",
                ),
                SpacerUtil.hspace(16.h),
                const AppFormField(
                  image: "Lock.png",
                  title: "Password",
                ),
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 210.w, right: 20.h, top: 18.h, bottom: 17.h),
                      child: Text(
                        maxLines: 1,
                        "Forgot Password?",
                        style: Styles.smallText(color: const Color(0xff230a06)),
                      ),
                    )),
                AppButton(
                    title: "Log In",
                    function: () {
                      Get.to(() => const DashBoardScreen());
                    },
                    isLarge: false),
                SpacerUtil.hspace(75.h),
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
                    const TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const SignUpScreen());
                        },
                      text: 'Sign Up',
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
                borderRadius: BorderRadius.circular(30.r))),
        onPressed: function,
        child: Text(title));
  }
}
