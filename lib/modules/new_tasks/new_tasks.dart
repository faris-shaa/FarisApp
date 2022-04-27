import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/cubit/cubit.dart';
import 'package:project/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget
{
  const NewTasksScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
      listener:(context, state){} ,
      builder: (context, state)
      {
        var tasks = AppCubit.get(context).newTasks;

        return  ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
