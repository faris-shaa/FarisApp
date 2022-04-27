import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get (BuildContext context) {
    return BlocProvider.of(context);
  }

  int conter = 1;


  void minus(){
    conter--;
    emit(CounterMinusState());
  }

  void plus(){
    conter++;
    emit(CounterPlusState());
  }

}
