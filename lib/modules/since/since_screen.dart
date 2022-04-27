import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/news_app/cubit/cubit.dart';
import 'package:project/layout/news_app/cubit/states.dart';
import 'package:project/shared/components/components.dart';

class Since_Screen extends StatelessWidget
{
  const Since_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(

      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).Since;

        return articleBuilder(list, context);
      },

    );
  }
}
