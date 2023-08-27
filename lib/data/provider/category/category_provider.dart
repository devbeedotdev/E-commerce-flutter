import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/services/category_service.dart';
import 'package:shopping_app/view_model/get_category_vm.dart';

final categoryServiceProvider =
    Provider<CategoryService>((ref) => CategoryService());

final categoryViewModel =
    ChangeNotifierProvider<CategoryViewModel>((ref) => CategoryViewModel(ref));
