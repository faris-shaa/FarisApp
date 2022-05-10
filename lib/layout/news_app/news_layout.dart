import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/news_app/cubit/cubit.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_cubit.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/layout/news_app/cubit/states.dart';
import 'package:project/modules/search_screen/search_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/cubit/cubit.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

import 'cubit/mode_theme/modetheme_states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSince()..getSports(),


      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News',
              ),
              actions: [
                IconButton(
                  onPressed: ()
                  {
                    NavgateTo(context, SearchScreen(),);

                  },
                  icon: Icon(
                  Icons.search,
                ),
                ),
                IconButton(
                  onPressed: ()
                  {
                    ModethemeCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                ),
              ],

            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
