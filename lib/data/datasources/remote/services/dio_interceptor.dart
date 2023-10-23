import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marshather_app/utils/utils.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var headerMessage = '';
    options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    try {
      options.queryParameters.forEach(
        (k, v) => debugPrint(
          '► $k: $v',
        ),
      );
    } catch (_) {}

    try {
      const encoder = JsonEncoder.withIndent('  ');
      final prettyJson = encoder.convert(options.data);
      log(
        // ignore: unnecessary_null_comparison
        "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
        'Headers:\n'
        '$headerMessage\n'
        '❖ QueryParameters : \n'
        'Body: $prettyJson',
      );
    } catch (e) {
      prettyLog.e('Failed to extract json request $e');
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      "<-- ${err.message} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}\n\n"
      "${err.response != null ? err.response!.data : 'Unknown Error'}",
    );

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var headerMessage = '';
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    const encoder = JsonEncoder.withIndent('  ');
    final prettyJson = encoder.convert(response.data);

    log(
      "◀ ︎RESPONSE ${response.statusCode} ${response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL'}\n\n"
      'Headers:\n'
      '$headerMessage\n'
      '❖ Results : \n'
      'Response: $prettyJson',
    );
    super.onResponse(response, handler);
  }
}
