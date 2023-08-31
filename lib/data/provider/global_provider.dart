import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/view/presentation/loading_screen.dart';

int cartIndex = 0;
// dynamic cartVm;
// dynamic productsData;
final indexProvider = StateProvider<int>((ref) => 0);

final isCheckedProvider = StateProvider<bool>((ref) => false);

final isLoadingProvider =
    ChangeNotifierProvider<LoadingMethod>((ref) => LoadingMethod());

class LoadingMethod extends ChangeNotifier {
  bool isLoading = false;
  void loadingOn() {
    isLoading = true;
    notifyListeners();
  }

  void loadingOff() {
    isLoading = false;
    notifyListeners();
  }
}

final load = LoadingScreen().animate();
