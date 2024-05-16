import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/news_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'News',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Cloud',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 233, 213, 31),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                bool isDark =
                    BlocProvider.of<ChangeThemeCubit>(context).isDarkTheme;
                setState(() {
                  isDark = !isDark;
                });
                BlocProvider.of<ChangeThemeCubit>(context)
                    .changeTheme(isDark: isDark);
              },
              icon: Icon(
                !BlocProvider.of<ChangeThemeCubit>(context).isDarkTheme
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CategoriesListView()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          NewsListViewBuilder(),
        ],
      ),
    );
  }
}
