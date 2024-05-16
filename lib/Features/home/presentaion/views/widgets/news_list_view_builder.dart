import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubits/news_data_cubit/news_data_cubit.dart';
import '../../manager/cubits/news_data_cubit/news_data_state.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  Future<void> getNewsData() async {
    await BlocProvider.of<NewsDataCubit>(context)
        .fetchNewsData(categoryName: 'general');
  }

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDataCubit, NewsDataState>(
      builder: (context, state) {
        if (state is NewsDataFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.33),
              child: Text(
                '${state.errMessage}, Please try again',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        } else if (state is NewsDataSuccess) {
          return NewsListView(articles: state.newsData);
        } else {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.33),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }
}
