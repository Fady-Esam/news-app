import 'package:dartz/dartz.dart';
import 'package:news_app/Features/home/data/models/article_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ArticleModel>>> getNewsData(
      {required String categoryName});
}
