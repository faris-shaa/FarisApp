
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/shop_app/login/cubit/states.dart';
import 'package:project/shared/network/end_points.dart';
import 'package:project/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>

{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,

  })
{
  emit(ShopLoginLoadingState());
DioHelper.postData(
    url: LOGIN,
    data:
    {
      'email':'email',
      'password':'email',
    },).then((value)
{
  print (value);
  emit(ShopLoginSuccessState());
}).catchError((error)
{
  emit(ShopLoginErrorState(error.toString()),);
});
}

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changeIconVisibality ()
  {
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility : Icons.visibility_off_outlined;

    emit(ShopChangeVisibilityState());


  }
}