


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/news_app/cubit/mode_theme/modetheme_states.dart';
import 'package:project/shared/network/local/cache_helper.dart';



class ModethemeCubit extends Cubit<ModethemeStates>
{
  ModethemeCubit() : super(ModethemeInitial());


  static ModethemeCubit get(context) => BlocProvider.of(context);

  bool isDark = true;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(NewsModethemeChangeState());
    }

    else
    {
      isDark = !isDark;
      CasheHelper.putBoolean(
        key: 'isDark', value: isDark,).then((value)
      {
        emit(NewsModethemeChangeState());
      });
    }

  }





}
