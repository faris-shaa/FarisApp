import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/cubit/cubit.dart';
import 'package:project/shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget
{
  const ArchivedTasksScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
      listener:(context, state){} ,
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).archivedTasks;

        return  ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: tasks.length,
        );
      },
    );
  }
}
