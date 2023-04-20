import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_election_system/modules/HomeScreen/cubit/cubit.dart';
import 'package:online_election_system/modules/HomeScreen/cubit/state.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit =HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Online Election App'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle_rounded,
                  size: 30,),
                )
              ],
            ),
            body: cubit.Screens[cubit.current_index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
