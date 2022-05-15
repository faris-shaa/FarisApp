import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/todo_app/archived_tasks/archived_tasks.dart';
import 'package:project/modules/todo_app/done_tasks/done_tasks.dart';
import 'package:project/modules/todo_app/new_tasks/new_tasks.dart';
import 'package:project/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>

{
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);



  List<Widget> screen =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String>? titels =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];



  int currentIndex = 0;

  void changeindex (int index)
  {
    currentIndex = index;
    emit(AppChanBottomNavBarState());
  }

  late Database database;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];


  void createDatabase()

  {
    openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
          print('database created');
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)')
              .then((value) {
            print ('table created');

          }).catchError((error) {
            print ('error when creating ${error.toString()}');
          });
        }, onOpen: (database)
        {
          getDataFromDatabase(database);
          print('database opened');
        }).then((value)
    {
      database = value;
      emit(AppCreatDatabaseState());
    });
  }

  Future <void> insertToDatabase({
    required String title,
    required String time,
    required String date,
  })
  async {
    database.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO tasks(title, time, date, status) VALUES("$title","$time","$date","new")')
          .then((value) {

        print('$value inserted successfully');

        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      });
    });
  }

  void getDataFromDatabase(database)
  {
    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      newTasks = [];
      doneTasks = [];
      archivedTasks = [];

      value.forEach((element)
      {
        if(element['status'] == 'new')
          newTasks.add(element);
        else
          if (element['status'] == 'done')
            doneTasks.add(element);
          else archivedTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });

  }

  void updateData({
    required String status,
    required int id,

}) async
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE  id = ?',
        ['$status', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppUpdateDatabase());
    });

  }

  void deletData (
  {
  required int id,
}) async
  {
  database
        .rawDelete('DELETE FROM tasks WHERE id = ?', [id]
  ).then((value)
  {
    getDataFromDatabase(database);
    emit(AppDeletDatabaseState());
  });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changBottomSheet (
  {
    required bool isShow,
    required IconData icon,
  })
   {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangBottomSheetState());
   }
   

 }