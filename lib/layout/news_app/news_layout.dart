import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/news_app/cubit/cubit.dart';
import 'package:project/layout/news_app/cubit/states.dart';
import 'package:project/shared/cubit/cubit.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

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

                  },
                  icon: Icon(
                  Icons.search,
                ),
                ),
                IconButton(
                  onPressed: ()
                  {
                    NewsCubit.get(context).changeAppMode();
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
