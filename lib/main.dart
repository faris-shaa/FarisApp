import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_cubit.dart';
import 'package:project/layout/news_app/news_layout.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:project/shared/network/remote/dio_helper.dart';
import 'layout/news_app/cubit/mode_theme/modetheme_states.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(()
           {

             runApp(MyApp(true));
           },
    blocObserver: MyBlocObserver(),
  );



  DioHelper.init();
  await CasheHelper.init();
  bool? isDark = CasheHelper.getBoolean(key: 'isDark');


}

class MyApp extends StatelessWidget {


  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => ModethemeCubit()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<ModethemeCubit, ModethemeStates>(
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
            themeMode: ModethemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },

      ),
    );
  }
}
