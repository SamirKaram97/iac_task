import 'package:dio/dio.dart';
import 'package:iac_task/core/utils/app_constants.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'api_config.dart';

class APIService {
  static late Dio _dio;

  static init()  {
    _dio = Dio(
      BaseOptions(
          baseUrl: APIConfig.baseApiUrl,
          connectTimeout: AppConstants.apiDefaultDuration,
          receiveTimeout: AppConstants.apiDefaultDuration,
          sendTimeout: AppConstants.apiDefaultDuration,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'json',
          }),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Check internet connection before every request
            if (!await InternetConnectionChecker.instance.hasConnection) {
              return handler.reject(
                DioException(
                  requestOptions: options,
                  error: AppStrings.noInternetConnection,
                  type: DioExceptionType.connectionError,
                ),
              );
            }
            handler.next(options); // Proceed with the request
          },
        ),
      );
  }

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? deviceToken,
    String? token,
    bool? isAuth = true,
  }) async {
    var response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response;
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    bool? isAuth = true,
  }) async {
    var response = await _dio.get(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );

    return response;
  }
}
