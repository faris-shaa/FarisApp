import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/modules/counter/cubit/cubit.dart';
import 'package:project/modules/counter/cubit/states.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: ()
                      {
                        CounterCubit.get(context).minus();

                      },
                      child: Text(
                        'MINUS'
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).conter}',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: ()
                      {
                        CounterCubit.get(context).plus();

                      },
                      child: Text(
                          'PLUS'
                      )),
                ],
              ),
            ),
          );
          },
      ),
    );
  }
}
