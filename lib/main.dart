import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/news_app/cubit/cubit.dart';
import 'package:project/layout/news_app/cubit/states.dart';
import 'package:project/layout/news_app/news_layout.dart';
import 'package:project/modules/bmi_result/bmi_result_screen.dart';
import 'package:project/modules/bmi/bmi_screen.dart';
import 'package:project/modules/counter/counter.dart';
import 'package:project/modules/login/login_screen.dart';
import 'package:project/modules/messnger_screen/messenger_screen.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/shared/cubit/cubit.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

import 'layout/todo_app/home_layout.dart';
import 'modules/user/user_screen.dart';


void main()
{
  BlocOverrides.runZoned(()
           {
             runApp(MyApp());
           },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();


}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87
                ),
              ),

              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.black87,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739')
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },

      ),
    );
  }
}
