// ignore_for_file: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/core/app_constants.dart';
import 'package:weather/core/models/weather_data.dart';

abstract class Repository {
  Repository._();

  static Future<Either<WeatherData, dynamic>> getWeatherInfo({
    String? country,
  }) async {
    final dio = Dio()
      ..interceptors.add(LogInterceptor(
          responseHeader: false,
          requestHeader: true,
          responseBody: true,
          requestBody: true));
    try {
      final response = await dio.get(
        "${AppConstants.baseUrl}/v1/current.json",
        queryParameters: {
          "key": AppConstants.keyToken,
          "q": country ?? "Tashkent",
          "aqi": 'no',
        },
      );
      return left(WeatherData.fromJson((response.data)));
    } catch (e) {
      debugPrint('===> ($country) error: $e ');
      return right(e);
    }
  }
}
