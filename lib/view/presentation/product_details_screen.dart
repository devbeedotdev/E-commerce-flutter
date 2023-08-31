import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/provider/category/category_provider.dart';
import 'package:shopping_app/data/provider/global_provider.dart';
import 'package:shopping_app/view/widgets/appbutton.dart';
import 'package:shopping_app/data/utils/spacer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  final pageIndex = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context) {
    final categoryVm = ref.watch(categoryViewModel);
    final inCategoryVm = ref.watch(categoryViewModel).inCategoryData.data;
    return categoryVm.inCategoryData.autoloading
        ? load
        : Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon:
                      const Icon(color: Colors.black, IconlyLight.arrow_left_2),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(color: Colors.black, IconlyLight.heart),
                  ),
                ]),
            body: Column(
              children: [
                SizedBox(
                    height: 400.h,
                    width: 340.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: PageView.builder(
                              onPageChanged: (index) {
                                ref.read(pageIndex.notifier).state = index;
                              },
                              itemCount: categoryVm.inCategoryData.data!.length,
                              itemBuilder: (context, index) {
                                return Image.network(categoryVm
                                    .inCategoryData.data![index]["image"]);
                              }),
                        )
                      ],
                    )),
                SpacerUtil.hspace(30.h),
                AnimatedSmoothIndicator(
                    activeIndex: ref.watch(pageIndex),
                    count: categoryVm.inCategoryData.data!.length,
                    effect: const SlideEffect(
                        paintStyle: PaintingStyle.stroke,
                        dotColor: Colors.grey,
                        activeDotColor: Color(0xffF67952))),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      isLoading: false,
                      title: "Checkout",
                      function: () {
                        openSheet(context, inCategoryVm, ref.watch(pageIndex));
                      },
                      isLarge: false,
                    ),
                  ],
                ),
                SpacerUtil.hspace(10.h)
              ],
            ));
  }
}

void openSheet(context, data, index) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21.w, right: 19.w, top: 30.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          data[index]["title"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        data[index]["price"].toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SpacerUtil.hspace(16.53.h),
                  Text(data[index]["description"], style: Styles.smallText()),
                  SpacerUtil.hspace(109.46.h),
                  AppButton(
                      isLoading: false,
                      title: "Add to Cart",
                      function: () {},
                      isLarge: true),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        );
      });
}



//   void openSheets(){
//     showModalBottomSheet(
//       isScrollControlled: true,
//     shape: const OutlineInputBorder(
//     borderSide: BorderSide.none,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),topRight: Radius.circular(20))
//     ),
//       context: context,
//       builder: (context) {
//         return Wrap(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 21,right: 19,top: 30),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: 200,
//                         child: Text(widget.info.title,
//                         style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
//                       ),
//                       Text(r"$"widget.info.price.toString(),
//                         style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
//                     ],
//                   ),
//                   const SizedBox(height: 16.53,),
//                   Text(widget.info.description,style: const TextStyle(fontSize: 12),)
//                   ,const SizedBox(height: 109.46,)
//                     ,ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xffF67952),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                     fixedSize: const Size(253,55)
//                     ),
//                     onPressed: (){
//                       Navigator.pop(context);
//                       ErrMes.showSnackBar("Product has been added to cart",color: const Color(0xffF67952));
//                     }, child: const  Text("Add to Cart",
//                       style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
//                     ),
//                               const SizedBox(height: 20,)
//                 ],
//               ),
//             ),
//           ],
//         );
//       });
//   }
// }