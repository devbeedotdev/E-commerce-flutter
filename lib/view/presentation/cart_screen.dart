import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:iconly/iconly.dart";
import "package:shopping_app/data/helpers/storage_helper.dart";
import "package:shopping_app/data/helpers/style_helper.dart";
import "package:shopping_app/data/provider/category/category_provider.dart";
import "package:shopping_app/data/provider/global_provider.dart";
import 'package:shopping_app/view/widgets/appbutton.dart';
import 'package:shopping_app/view/widgets/cards/cart_tile.dart';
import "package:shopping_app/data/utils/spacer.dart";

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  StateProvider<bool> isCalculated = StateProvider<bool>(
    (ref) => false,
  );
  List<num> allPrice = [];
  StateProvider<double> totalPriceProvider =
      StateProvider<double>((ref) => 0.0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartVm = ref.watch(categoryViewModel).getCartData;
    final productsVm = ref.watch(categoryViewModel).getProductsData;
    return cartVm.autoloading || productsVm.autoloading
        ? load
        : Scaffold(
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
                bottom: 10.h,
                left: 10.w,
                right: 10.w,
              ),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      children: List.generate(cartVm.data!["products"].length,
                          (index) {
                    cartIndex = index;
                    return CartTile(
                      productId: cartVm.data!["products"][index]["productId"],
                      productsData: productsVm,
                      index: index,
                      cartData: cartVm,
                    );
                  })),
                  SpacerUtil.hspace(150.h),
                  Column(
                    children: [
                      ref.watch(isCalculated)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal :",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                  "\$${ref.watch(totalPriceProvider) == 0 ? StorageHelper.getString("Answer") : ref.watch(totalPriceProvider)}",
                                  style: Styles.mediumText(),
                                ),
                              ],
                            )
                          : Container(),
                      SpacerUtil.hspace(5.h),
                      AppButton(
                          isLoading: false,
                          title: "Calculate Price",
                          function: () {
                            ref.read(isCalculated.notifier).state = true;
                            double sumPrice = 0.0;
                            StorageHelper.delete("Answer");
                            // int sumQuantity;
                            for (int i = 0;
                                i < cartVm.data!["products"].length;
                                i++) {
                              allPrice.add(productsVm.data![
                                      cartVm.data!["products"][i]
                                          ["productId"]]["price"] *
                                  cartVm.data!["products"][i]["quantity"]);
                              // print(productsVm.data![cartVm.data!["products"][i]
                              //     ["productId"]]["price"]);
                              // print(cartVm.data!["products"][i]["quantity"]);
                              // print(allPrice);
                            }
                            for (num number in allPrice) {
                              sumPrice += number;
                            }
                            StorageHelper.setString("Answer", "$sumPrice");
                            // sumPrice = allPrice.fold(0, (p, c) => p + c);
                            ref.watch(totalPriceProvider.notifier).state =
                                sumPrice;
                            allPrice = [];
                          },
                          isLarge: false)
                    ],
                  ),
                ],
              )),
            ));
  }

  // double checks (){
  //   final tAmount = totalAmount(cartIndex, cartVm, productsVm);
  //   if()
  // }

  // double totalAmount(index, cartVm, productsData) {
  //   late double eachPrice;
  //   for (var i = 0; i < index; i++) {
  //     eachPrice = productsData
  //         .data![cartVm.data!["products"][index]["productId"]]["price"];
  //     ref.read(totalPriceProvider.notifier).state += eachPrice;
  //   }
  //   return eachPrice;
  // }
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
