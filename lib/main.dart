import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopping_app/view/presentation/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(width, height),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    backgroundColor: Color(0xffFBFBFD), elevation: 0),
                scaffoldBackgroundColor: const Color(0xffFBFBFD)),
            home: Scaffold(
              body: AnimatedSplashScreen(
                duration: 250,
                splash: 'assets/images/splash.png',
                nextScreen: const LoginScreen(),
                splashTransition: SplashTransition.rotationTransition,
              ),
            ),
          );
        });
  }
}
