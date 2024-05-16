import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Features/home/data/models/article_model.dart';
import 'package:news_app/Features/home/data/repos/home_repo.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/utils/api_service.dart';

import '../../../../secrets/app_secrets.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ArticleModel>>> getNewsData(
      {required String categoryName}) async {
    try {
      var res = await apiService.get(
          endPoint:
              '/top-headlines?category=$categoryName&country=us&apiKey=${AppSecrets.apiKey}');
      List<ArticleModel> articleModelList = [];
      for (var e in res['articles']) {
          articleModelList.add(ArticleModel.fromJson(e));
      }
      return right(articleModelList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErro(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
