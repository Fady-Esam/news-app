import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/core/utils/api_service.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));
}
