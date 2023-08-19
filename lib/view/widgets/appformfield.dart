import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController controller;
  final String image;
  final String title;
  const AppFormField({
    required this.controller,
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: const Color(0xffF67952),
      decoration: InputDecoration(
          hintStyle: Styles.smallText(),
          hintText: title,
          prefixIcon: Container(
              margin: const EdgeInsets.only(right: 5, left: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0x1AF67952)),
              width: 48.w,
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      width: 24.w,
                      height: 24.h,
                      image: AssetImage("assets/images/$image")),
                ],
              )),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 1.5, color: Color(0xffF67952))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}

class SearchAppFormField extends StatelessWidget {
  final Widget icon;
  final String title;
  const SearchAppFormField({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xffF67952),
      decoration: InputDecoration(
          hintStyle: Styles.smallText(),
          hintText: title,
          prefixIcon: IconButton(
            icon: icon,
            onPressed: () {},
          ),
          suffixIcon: Container(
              margin: const EdgeInsets.only(right: 5, left: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF67952)),
              width: 48,
              height: 45,
              child:
                  const Icon(color: Colors.white, size: 18, IconlyBold.filter)),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 1.5, color: Color(0xffF67952))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
