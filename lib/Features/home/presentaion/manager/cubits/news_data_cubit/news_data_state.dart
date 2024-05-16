import 'package:news_app/Features/home/data/models/article_model.dart';

class NewsDataState {}

class NewsDataInitial extends NewsDataState {}

class NewsDataLoading extends NewsDataState {}

class NewsDataSuccess extends NewsDataState {
  final List<ArticleModel> newsData;

  NewsDataSuccess({required this.newsData});
}

class NewsDataFailure extends NewsDataState {
  final String errMessage;

  NewsDataFailure({required this.errMessage});
}
