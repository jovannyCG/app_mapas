import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1Ijoiam92c29mdCIsImEiOiJjbGdjcnFrNmUyM2xzM2hxcnZ2ZDRoMnUzIn0.-jkwRtGf8wWyi2ADXhmLBA';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });
    super.onRequest(options, handler);
  }
}
