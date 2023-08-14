import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';
import 'package:shopping_app/data/utils/appbutton.dart';
import 'package:shopping_app/data/utils/spacer.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(color: Colors.black, IconlyLight.arrow_left_2),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(color: Colors.black, IconlyLight.heart),
              ),
            ]),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    width: 273.w,
                    height: 363.h,
                    image: const AssetImage("assets/images/cloth_detail.png")),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  title: "Checkout",
                  function: () {
                    openSheet(context);
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

void openSheet(context) {
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Casual Henley Shirts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "\$230",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SpacerUtil.hspace(16.53.h),
                  Text(
                      "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
                      style: Styles.smallText()),
                  SpacerUtil.hspace(109.46.h),
                  AppButton(
                      title: "Add to Cart", function: () {}, isLarge: true),
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