import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/home/presentaion/views/home_view.dart';

import '../manager/cubits/news_data_cubit/news_data_cubit.dart';
import '../manager/cubits/news_data_cubit/news_data_state.dart';
import 'widgets/list_view_categroy.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.text});

  final String text;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  Future<void> getNewsData() async {
    await BlocProvider.of<NewsDataCubit>(context)
        .fetchNewsData(categoryName: widget.text);
  }

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: BlocBuilder<NewsDataCubit, NewsDataState>(
        builder: (context, state) {
          if (state is NewsDataFailure) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                '${state.errMessage}, Please try again',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } else if (state is NewsDataSuccess) {
            return ListViewCategory(
              articles: state.newsData,
            );
          } else {
            return const Align(
              alignment: Alignment.center,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
