import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/api/custom_exception.dart';
import 'package:shopping_app/view/presentation/no_network_screen.dart';

final isConnected = StateProvider<bool>((ref) => true);

void checkForNetworkExceptions(Response response) {
  if (response.statusCode! < 200 || response.statusCode! >= 400) {
    throw const CustomException('Failed to connect to internet');
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    if (kDebugMode) {
      debugPrint('${(received / total * 100).toStringAsFixed(0)}%');
    }
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    throw CustomException(e.message);
  }
}

checkNetworkConnection(WidgetRef ref) async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (!ref.read(isConnected)) {
        ref.read(isConnected.notifier).state = true;
        Get.back();
      }
    } else {
      if (ref.read(isConnected)) {
        ref.read(isConnected.notifier).state = false;
        Get.to(() => const NoNetworkScreen());
      }
    }
  } on SocketException catch (_) {
    if (ref.read(isConnected)) {
      ref.read(isConnected.notifier).state = false;
      Get.to(() => const NoNetworkScreen());
    }
  } catch (e) {
    if (ref.read(isConnected)) {
      ref.read(isConnected.notifier).state = false;
      Get.to(() => const NoNetworkScreen());
    }
  }
}
