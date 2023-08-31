import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/data/controllers/future_manager.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:shopping_app/view/presentation/cart_screen.dart';
import 'package:shopping_app/view/widgets/cards/small_display.dart';

class CartTile extends ConsumerStatefulWidget {
  final int productId;
  final FutureManager<Map<String, dynamic>> cartData;
  final FutureManager<List> productsData;
  final int index;
  const CartTile({
    super.key,
    required this.productId,
    required this.productsData,
    required this.cartData,
    required this.index,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartTileState();
}

class _CartTileState extends ConsumerState<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ListTile(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none),
          tileColor: const Color(0xffFFFFFF),
          leading: SmallDisplay(
              function: () {},
              title: "",
              image:
                  widget.productsData.data![widget.productId]["image"] ?? ""),
          title:
              Text(widget.productsData.data![widget.productId]["title"] ?? ""),
          subtitle: Text(
              "\$${widget.productsData.data![widget.productId]["price"] * widget.cartData.data!["products"][widget.index]["quantity"]}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconBox(
                  function: () {},
                  child: const Icon(
                      size: 12, Icons.remove, color: Color(0xffF67952))),
              SpacerUtil.wspace(10.w),
              Text(widget.cartData.data!["products"][widget.index]["quantity"]
                  .toString()),
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
