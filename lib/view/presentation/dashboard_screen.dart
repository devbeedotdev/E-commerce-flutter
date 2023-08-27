import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/data/provider/category/category_provider.dart';
import 'package:shopping_app/data/provider/global_provider.dart';
import 'package:shopping_app/view/presentation/cart_screen.dart';
import 'package:shopping_app/view/presentation/home_screen.dart';
import 'package:shopping_app/view/presentation/product_details_screen.dart';
import 'package:shopping_app/view/presentation/profile_screen.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  final List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const ProductDetailsScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryViewModel).getCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(indexProvider);
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          currentIndex: index,
          onTap: (value) {
            ref.read(indexProvider.notifier).state = value;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(IconlyLight.buy), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.heart), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.profile), label: "Profile"),
          ]),
    );
  }
}
