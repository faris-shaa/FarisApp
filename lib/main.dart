import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_cubit.dart';
import 'package:project/layout/news_app/news_layout.dart';
import 'package:project/modules/news_app/search_screen/search_screen.dart';
import 'package:project/modules/news_app/since/since_screen.dart';
import 'package:project/modules/news_app/sports/sports_screen.dart';
import 'package:project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:project/shared/network/remote/dio_helper.dart';
import 'package:project/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'modules/news_app/business/business_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  bool? isDark = CasheHelper.getBoolean(key: 'isDark');

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSince()
            ..getSports(),
        ),
        BlocProvider(
          create: (BuildContext context) => ModethemeCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ModethemeCubit, ModethemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ModethemeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
