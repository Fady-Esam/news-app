import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/Features/home/presentaion/views/home_view.dart';
import 'package:news_app/core/utils/simple_bloc_observer.dart';
import 'Features/home/presentaion/manager/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'Features/home/presentaion/manager/cubits/change_theme_cubit/change_theme_state.dart';
import 'Features/home/presentaion/manager/cubits/news_data_cubit/news_data_cubit.dart';
import 'core/utils/service_loacator.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setUpServiceLocator();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsDataCubit(getIt.get<HomeRepoImpl>())),
        BlocProvider(create: (context) => ChangeThemeCubit()),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'New App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: BlocProvider.of<ChangeThemeCubit>(context).isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
