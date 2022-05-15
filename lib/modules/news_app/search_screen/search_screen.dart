import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/news_app/cubit/cubit.dart';
import 'package:project/layout/news_app/cubit/states.dart';
import 'package:project/shared/components/components.dart';

class SearchScreen extends StatelessWidget {



  var searchController = TextEditingController();



  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit.get(context).Search;


        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CostumTextFormFeild(
                    label: 'Search',
                    controller: searchController,
                    type: TextInputType.text,
                    prefix: Icons.search,
                    onChange: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String? value)
                    {
                      if (value!.isEmpty)
                      {
                        return 'search must not be Empty';
                      }
                      return null;
                    }
                ),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },

    );
  }
}
