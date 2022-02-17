import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String onError;

  NewsGetBusinessErrorState(this.onError);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String onError;

  NewsGetSportsErrorState(this.onError);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String onError;

  NewsGetScienceErrorState(this.onError);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String onError;

  NewsGetSearchErrorState(this.onError);
}

class NewsGetHomeLoadingState extends NewsStates {}

class NewsGetHomeSuccessState extends NewsStates {}

class NewsGetHomeErrorState extends NewsStates {}

class ChangThemeModeSates extends NewsStates {}
