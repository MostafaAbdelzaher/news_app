import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import '../../../modules/home.dart';
import '../../../modules/business.dart';
import '../../../modules/science.dart';
import '../../../modules/sport.dart';
import '../../../shard/network/local/cache_helper.dart';
import '../../../shard/network/remote/Dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [
    const HomeScreen(),
    const BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
  ];
  List<String> title = [
    "News App ",
    "Business ",
    "Science ",
    "Sports ",
  ];
  List<BottomNavigationBarItem> bottomNav = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;

    emit(NewsBottomNavState());
  }

  List<dynamic> home = [];

  void getDataHome() {
    emit(NewsGetHomeSuccessState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "apiKey": "daadbbd3aad34492afb4e2fa84a5d559"
    }).then((value) {
      home = value.data['articles'];
      home.forEach((element) {});

      emit(NewsGetHomeSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetHomeErrorState());
    });
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "daadbbd3aad34492afb4e2fa84a5d559",
    }).then((value) {
      business = value.data['articles'];
      print(business[3][title]);
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sports",
      "apiKey": "daadbbd3aad34492afb4e2fa84a5d559",
    }).then((value) {
      sports = value.data['articles'];
      print(business[3][title]);
      emit(NewsGetSportsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSportsErrorState(onError.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "daadbbd3aad34492afb4e2fa84a5d559",
    }).then((value) {
      science = value.data['articles'];
      print(business[3][title]);
      emit(NewsGetScienceSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetScienceErrorState(onError.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "daadbbd3aad34492afb4e2fa84a5d559",
    }).then((value) {
      search = value.data['articles'];
      print(search[3][title]);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError.toString()));
    });
  }

  bool isDark = false;

  void changThemeMode({
    bool? fromShared,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangThemeModeSates());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: "isDark", value: isDark).then((value) {
        emit(ChangThemeModeSates());
      });
    }
  }
}
