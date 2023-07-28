import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final service =
      Dio(BaseOptions(baseUrl: 'https://assign-api.piton.com.tr/api/rest'));
}
