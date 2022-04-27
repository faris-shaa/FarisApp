import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/cubit/cubit.dart';
import 'package:project/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget
{


  var scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state)
        {
          if(state is AppInsertDatabaseState)
          {
            Navigator.pop(context);
          }
        },
        builder: (context, state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titels![cubit.currentIndex],),
            ),
            body:  state is AppGetDatabaseLoadingState
                ? const Center(child: CircularProgressIndicator())
                : cubit.screen[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (formKey.currentState != null &&
                    formKey.currentState!.validate())
                {
                  cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,);
                  // insertToDatabase(
                  //   time: timeController.text,
                  //   date: dateController.text,
                  //   title: titleController.text,
                  // ).then((value)
                  // {
                  //   Navigator.pop(context);
                  //   isBottomSheetShown = false;
                  //   // setState(() {
                  //   //   fabIcon = Icons.edit;
                  //   // });
                  // });
                }

                else {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.grey[100],
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CostumTextFormFeild(
                                type: TextInputType.text,
                                label: 'Title',
                                controller: titleController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'title must not br empty';
                                  }
                                  return null;
                                },
                                prefix: Icons.title,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CostumTextFormFeild(
                                type: TextInputType.text,
                                label: 'Time',
                                controller: timeController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'time must not br empty';
                                  }
                                  return null;
                                },
                                prefix: Icons.watch_later_outlined,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text = value!.format(context).toString();
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CostumTextFormFeild(
                                type: TextInputType.text,
                                label: 'Date',
                                controller: dateController,
                                onChange: null,
                                prefix: Icons.calendar_today,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2050-01-01'),
                                  ).then((value) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'date must not br empty';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ).closed.then((value)
                  {
                    cubit.changBottomSheet(
                        isShow: false,
                        icon: Icons.edit,);
                  });
                  cubit.changBottomSheet(
                      isShow: true,
                      icon: Icons.add,);
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeindex(index);
              },
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task),
                  label: 'New Task',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      )
    );
  }



}










