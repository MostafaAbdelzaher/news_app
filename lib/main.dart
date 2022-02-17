// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shard/bloc_observer.dart';
import 'package:news_app/shard/network/local/cache_helper.dart';
import 'package:news_app/shard/network/remote/Dio.dart';
import 'package:news_app/shard/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/states.dart';
import 'layout/news_app/newsApp_layout.dart';
import '../../../layout/news_app/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      var isDark = CacheHelper.getData(key: "isDark");
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({
    Key key,
    this.isDark,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getSports()
              ..getScience()
              ..getSports()
              ..getBusiness()
              ..getDataHome()
              ..changThemeMode(fromShared: isDark)),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: NewsApp(),
          );
        },
      ),
    );
  }
}
