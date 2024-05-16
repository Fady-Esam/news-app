import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/home/data/repos/home_repo.dart';

import 'news_data_state.dart';

class NewsDataCubit extends Cubit<NewsDataState> {
  NewsDataCubit(this.homeRepo) : super(NewsDataInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsData({required String categoryName}) async {
    emit(NewsDataLoading());
    var res = await homeRepo.getNewsData(categoryName: categoryName);
    res.fold((failure) {
      emit(NewsDataFailure(errMessage: failure.errMessage));
    }, (newsData) {
      emit(NewsDataSuccess(newsData: newsData));
    });
  }
}
