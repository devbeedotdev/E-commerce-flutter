import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:iconly/iconly.dart";
import "package:shopping_app/data/helpers/style_helper.dart";
import "package:shopping_app/data/utils/spacer.dart";
import "package:shopping_app/view/home_screen.dart";
import "package:shopping_app/view/login_screen.dart";

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(color: Colors.black, IconlyLight.arrow_left_2),
          ),
          title: Text(
            "My Cart",
            style: Styles.mediumText(),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Column(children: List.generate(5, (index) => const CartTile())),
              SpacerUtil.hspace(140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal :",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500)),
                  Text(
                    "\$250",
                    style: Styles.mediumText(),
                  ),
                ],
              ),
              SpacerUtil.hspace(20.h),
              AppButton(title: "CheckOut", function: () {}, isLarge: true)
            ],
          )),
        ));
  }
}

class IconBox extends ConsumerWidget {
  final Function()? function;
  final Widget child;
  const IconBox({required this.child, required this.function, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0x15F67952),
            borderRadius: BorderRadius.circular(5.r)),
        width: 26.w,
        height: 22.h,
        child: child,
      ),
    );
  }
}

class CartTile extends ConsumerWidget {
  const CartTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ListTile(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none),
          tileColor: const Color(0xffFFFFFF),
          leading: const SmallDisplay(title: "", image: ""),
          title: const Text("Henley Shirts"),
          subtitle: const Text("\$250"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconBox(
                  function: () {},
                  child: const Icon(
                      size: 12, Icons.remove, color: Color(0xffF67952))),
              SpacerUtil.wspace(10.w),
              const Text("1"),
              SpacerUtil.wspace(10.w),
              IconBox(
                  function: () {},
                  child: const Icon(
                      size: 12, Icons.add, color: Color(0xffF67952))),
            ],
          )),
    );
  }
}
