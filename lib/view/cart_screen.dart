import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:iconly/iconly.dart";
import "package:shopping_app/data/helpers/style_helper.dart";
import "package:shopping_app/data/utils/appbutton.dart";
import "package:shopping_app/data/utils/cart_tile.dart";
import "package:shopping_app/data/utils/spacer.dart";

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
