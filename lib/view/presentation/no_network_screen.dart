import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNetworkScreen extends ConsumerWidget {
  const NoNetworkScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF67952),
        title: const Text("No Network"),
      ),
      body: Center(
        child: Container(
            width: 128.w,
            height: 128.h,
            decoration: BoxDecoration(
                color: const Color(0xffF67952),
                borderRadius: BorderRadius.circular(100.r)),
            child: Image.asset("assets/images/no_network.png")),
      ),
    );
  }
}
