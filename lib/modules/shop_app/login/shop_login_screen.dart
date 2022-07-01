
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:project/modules/shop_app/login/cubit/cubit.dart';
import 'package:project/modules/shop_app/login/cubit/states.dart';
import 'package:project/modules/shop_app/shop_register/shop_register_screen.dart';
import 'package:project/shared/components/components.dart';

class ShopLoginScreen extends StatelessWidget
{
  var formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CostumTextFormFeild(
                            label: 'Email Address',
                            controller: emailController,
                            type: TextInputType.text,
                            prefix: Icons.email_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              }
                            }),
                        SizedBox(
                          height: 30.0,
                        ),
                        CostumTextFormFeild(
                            label: 'Password',
                            controller: passwordController,
                            type: TextInputType.text,
                            onSubmit: (value)
                            {
                              if (formkey.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            prefix: Icons.lock_outlined,
                            suffixPressed: ()
                            {

                            },
                            suffix: ShopLoginCubit.get(context).suffix,
                            onTap: (){ShopLoginCubit.get(context).changeIconVisibality(); },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              }
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        Conditional.single(
                            context: context,
                          conditionBuilder: (context) => state is! ShopLoginLoadingState,
                          widgetBuilder: (context)=>defaultButton(
                            width: double.infinity,
                            radius: 5.0,
                            background: Colors.blue,
                            function: ()
                            {
                              if (formkey.currentState!.validate())
                              {
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            text: 'login',
                          ),
                          fallbackBuilder: (context) => Center
                            (child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text(
                              'Don\'t have account ?',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                           defaultTextButton(
                                function: ()
                                {
                                  NavigaTo(
                                    context,
                                    ShopRegisterScreen(),);
                                },
                              text: 'Register',
                               ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
