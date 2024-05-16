import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://newsapi.org/v2';
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var res = await dio.get(baseUrl + endPoint);
    return res.data;
  }
}
