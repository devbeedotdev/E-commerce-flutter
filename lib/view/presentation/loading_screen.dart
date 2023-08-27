// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shopping_app/data/controllers/animation_controller.dart';

// class LoadingScreen extends ConsumerStatefulWidget {
//   final bool startAnimating;
//   const LoadingScreen({required this.startAnimating, super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends ConsumerState<LoadingScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     animation = CurvedAnimation(
//       parent: animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     animationController.dispose();
//   }

//   void _startAnimation() {
//     if (animationController.status == AnimationStatus.completed) {
//       animationController.reverse();
//     } else {
//       animationController.forward();
//     }
//     print(animationController.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: GestureDetector(
//           onTap: widget.startAnimating ? _startAnimation : () {},
//           child: AnimatedContainer(
//               width: animationController.value * 100,
//               height: animationController.value * 100,
//               duration: const Duration(seconds: 1),
//               child: Image.asset("assets/images/app_logo.png")),
//         ),
//       ),
//     );
//   }
// }
