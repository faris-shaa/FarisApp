import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/news_app/cubit/states.dart';
import 'package:project/modules/business/business_screen.dart';
import 'package:project/modules/search_screen/search_screen.dart';
import 'package:project/modules/since/since_screen.dart';
import 'package:project/modules/sports/sports_screen.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
     icon: Icon(
         Icons.business,
       ),
     label: 'Business',
   ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_soccer,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Since',
    ),
  ];


  List<Widget> screens =
  [
    Business_Screen(),
    Sports_Screen(),
    Since_Screen(),
    SearchScreen(),

  ];


  void changeBottomNavBar (int index)
  {
    currentIndex = index;
    emit(NewsBottomNavState());
  }



  List<dynamic> Business = [];
  List<dynamic> Sports = [];
  List<dynamic> Since = [];
  List<dynamic> Search = [];



  void getBusiness ()
  {

    emit(NewsBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'4a15ef6bec9e4a4e937464d6d0eb413b',
        }).then((value)
    {
      Business = value.data['articles'];

      // print(Business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSinceErrorState(error.toString()));
    });
  }



  void getSports ()
  {

    emit(NewsSportsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'4a15ef6bec9e4a4e937464d6d0eb413b',
        }).then((value)
    {
      Sports = value.data['articles'];

      // print(Business[0]['title']);

      emit(NewsGteSportsSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }



  void getSince ()
  {

    emit(NewsSinceLoadingState());
    Search = [];

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'4a15ef6bec9e4a4e937464d6d0eb413b',
        }).then((value)
    {
      Since = value.data['articles'];

      // print(Business[0]['title']);

      emit(NewsGteSinceSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSinceErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
      {
        isDark = fromShared;
        emit(NewsAppChangeModeState());
      }

    else
    {
      isDark = !isDark;
      CasheHelper.putBoolean(
        key: 'isDark',
        value: isDark,).then((value)
      {
        emit(NewsAppChangeModeState());
      });
    }

  }



  void getSearch (String value)
  {

    emit(NewsSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'4a15ef6bec9e4a4e937464d6d0eb413b',
        }).then((value)
    {
      Search = value.data['articles'];

      print(Search[0]['title']);

      emit(NewsGteSearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}