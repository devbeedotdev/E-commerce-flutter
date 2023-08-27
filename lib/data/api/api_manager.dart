import 'dart:developer' as logger;

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping_app/data/api/custom_exception.dart';
import 'package:shopping_app/model/formatted_response.dart';
import 'package:shopping_app/data/utils/network.dart' as networkutils;

abstract class ApiManager {
  late Dio dio;

  final baseURL = 'https://fakestoreapi.com';

  ApiManager() {
    var cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 30),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    final options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60), // 90 seconds
    );

    dio = Dio(options)
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  //GET
  Future<FormattedResponse> getHttp(String route,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      bool formdata = false,
      dynamic token}) async {
    setHeader(formdata: formdata, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    return makeRequest(dio.get(
      fullRoute,
      data: body,
      queryParameters: params,
    ));
  }

  //POST
  Future<FormattedResponse> postHttp(String route, dynamic body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      dynamic token,
      void Function({int count, int total})? onSendProgress,
      void Function({int count, int total})? onRecieveProgress}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(dio.post(
      fullRoute,
      data: body,
      onSendProgress: (count, total) {
        if (onSendProgress != null) {
          onSendProgress(count: count, total: total);
        }
        networkutils.showLoadingProgress(count, total);
      },
      onReceiveProgress: ((count, total) {
        if (onRecieveProgress != null) {
          onRecieveProgress(count: count, total: total);
        }
        networkutils.showLoadingProgress(count, total);
      }),
      queryParameters: params,
    ));
  }

  //PUT
  Future<FormattedResponse> putHttp(String route, dynamic body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      dynamic token}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(dio.put(
      fullRoute,
      data: body,
      onSendProgress: networkutils.showLoadingProgress,
      onReceiveProgress: networkutils.showLoadingProgress,
      queryParameters: params,
    ));
  }

  //PATCH
  Future<FormattedResponse> patchHttp(String route, dynamic body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      dynamic token}) async {
    setHeader(formdata: formdata, formEncoded: formEncoded, token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return makeRequest(dio.patch(
      fullRoute,
      data: body,
      onSendProgress: networkutils.showLoadingProgress,
      onReceiveProgress: networkutils.showLoadingProgress,
      queryParameters: params,
    ));
  }

  //DELETE
  Future deleteHttp(String route,
      {Map<String, dynamic>? params, dynamic token}) async {
    setHeader(token: token);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';

    return makeRequest(dio.delete(
      fullRoute,
      queryParameters: params,
    ));
  }

  Future<FormattedResponse> makeRequest(Future<Response> future) async {
    Response? response;
    try {
      response = await future;
      logger.log('data: ${response.data}');
    } on DioException catch (e) {
      logger.log('data: ${e.error.toString()}');
      logger.log('data: ${e.type.name}');
      if (kDebugMode) {
        logger.log('HTTP SERVICE ERROR MESSAGE: ${e.message}');
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return FormattedResponse(
          responseCodeError: "Connection Timeout",
          success: false,
          statusCode: e.response?.statusCode,
        );
      } else if (e.type == DioExceptionType.unknown) {
        if (e.message!.contains('SocketException')) {
          return FormattedResponse(
            data: response?.data,
            responseCodeError:
                "Oops! An error occured. Please check your internet and try again.",
            success: false,
          );
        }
      } else if (e.response!.statusCode == 401) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Unauthorized action",
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.response!.statusCode == 404) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Oops! Resource not found",
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.response!.statusCode == 500 ||
          e.response!.statusCode == 403) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError:
              "Oops! It's not you, it's us. Give us a minute and then try again.",
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.response!.statusCode == 400) {
        return FormattedResponse(
          data: e.response?.data,
          success: false,
          statusCode: e.response!.statusCode,
        );
      } else if (e.type == DioExceptionType.badResponse ||
          e.type == DioExceptionType.unknown) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "${e.error} - ${e.message}",
          success: false,
          statusCode: e.response!.statusCode,
        );
      }
    } catch (err) {
      if (err is DioException) {
        throw const CustomException('Something went wrong');
      }
    }
    return FormattedResponse(
      data: response?.data,
      success: "${response?.statusCode}".startsWith('2'),
      statusCode: response!.statusCode,
    );
  }

  setHeader(
      {bool formdata = false, bool formEncoded = false, dynamic token}) async {
    final Map<String, dynamic> header = {
      'content-type': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };

    dio.options.headers.addAll(header);
  }

  void dispose() {
    dio.close(force: true);
  }

  clearHeaders() {
    dio.options.headers.clear();
  }
}
