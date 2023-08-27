import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/services/onboarding_service.dart';
import 'package:shopping_app/view_model/get_user_vm.dart';

final onboardingServiceProvider =
    Provider<OnboardingService>((ref) => OnboardingService());

final onboardingViewModel = ChangeNotifierProvider<OnboardingViewModel>(
    (ref) => OnboardingViewModel(ref));
