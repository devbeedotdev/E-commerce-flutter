// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoadingScreen extends ConsumerStatefulWidget {
//   const LoadingScreen({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends ConsumerState<LoadingScreen>
//     with SingleTickerProviderStateMixin {
//   late Animation _animation;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this);
//     _animation = Tween<double>(begin: 10, end: 50).animate(_controller)
//       ..addListener(() {
//         print(_controller.value);
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           _controller.forward();
//         }
//       })
//       ..addStatusListener((status) => print('$status'));
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: _controller.value,
//         width: _controller.value,
//         child: Image.asset(
//           "assets/images/app_logo.png",
//         ));
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  final bool? isTransprent;
  const LoadingScreen({super.key, this.isTransprent = true});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  final scaleProvider = StateProvider<double>((ref) => 1.0);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    timer = Timer.periodic(const Duration(milliseconds: 350), (_) {
      ref.read(scaleProvider.notifier).state = (ref.read(scaleProvider) == 0.7)
          ? 1.0
          : (ref.read(scaleProvider) == 1)
              ? 1.2
              : (ref.read(scaleProvider) == 1.2)
                  ? 1.5
                  : (ref.read(scaleProvider) == 1.5)
                      ? 1
                      : 0.7;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ModalBarrier(
          dismissible: false,
          color:
              Colors.white.withOpacity(widget.isTransprent ?? true ? 0.9 : 1),
          semanticsLabel: 'Loading',
          barrierSemanticsDismissible: false,
        ),
        AnimatedScale(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
          scale: ref.watch(scaleProvider),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Opacity(
                opacity: widget.isTransprent ?? true ? 0.9 : 1,
                child: Image.asset('assets/images/app_logo.png')),
          ),
        )
      ],
    );
  }
}
