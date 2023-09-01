import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopping_app/data/helpers/validation_helper.dart';
import 'package:shopping_app/data/controllers/form_controllers.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/provider/onboarding/onboarding_provider.dart';
import 'package:shopping_app/view/presentation/dashboard_screen.dart';
import 'package:shopping_app/view/widgets/appbutton.dart';
import 'package:shopping_app/view/widgets/appformfield.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:shopping_app/view/presentation/signup_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginScreenWidget());
  }
}

class LoginScreenWidget extends ConsumerStatefulWidget {
  const LoginScreenWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends ConsumerState<LoginScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final onboardingVm = ref.watch(onboardingViewModel);
    return  SafeArea(
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 20.h,
                right: 20.w,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: loginFormKey,
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
                      AppFormField(
                        isObscure: false,
                        validator: (data) =>
                            ValidationHelper.isValidInput(data!),
                        controller: username,
                        image: "Profile.png",
                        title: "Username",
                      ),
                      SpacerUtil.hspace(16.h),
                      AppFormField(
                        isObscure: false,
                        validator: (data) =>
                            ValidationHelper.isValidInput(data!),
                        controller: password,
                        image: "Lock.png",
                        title: "Password",
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  maxLines: 1,
                                  "Forgot Password?",
                                  style: Styles.smallText(
                                      color: const Color(0xff230a06)),
                                ),
                              ],
                            ),
                          )),
                      AppButton(
                          title: "Log In",
                          function: () async {
                            if (loginFormKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              final success = await ref
                                  .read(onboardingViewModel)
                                  .elogin(
                                      username: username.text.trim(),
                                      password: password.text.trim());
                              if (success) {
                                Get.to(() => const DashBoardScreen());
                              }
                            } else {
                              return;
                            }
                          },
                          isLoading: onboardingVm.loginData.loading,
                          isLarge: false),
                      SpacerUtil.hspace(54.h),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  width: 70.88,
                                  height: 70.88,
                                  "assets/images/fb_logo.png"),
                            ],
                          ),
                          Image.asset(
                              width: 70.88,
                              height: 70.88,
                              "assets/images/google_logo.png")
                        ],
                      ),
                      SpacerUtil.hspace(50.h),
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
              ),
            )),
          );
  }
}
