import 'package:blockexample/cubit/internet_cubit.dart';
import 'package:blockexample/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/internet_bloc/internet_bloc.dart';
import '../bloc/internet_bloc/internet_state.dart';

class CubitExample extends StatelessWidget {
  final String title;

  const CubitExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetCubitState>(
          listener: (context, state) {
            if (state == InternetCubitState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Connected !"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetCubitState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Not Connected !"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state == InternetCubitState.Gained) {
              return const Text("You are Connected !");
            } else if (state == InternetCubitState.Lost) {
              return const Text("You are not connected !");
            } else {
              return const Text("Loading...");
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     // here you want to check value so use ==
        //     // fi you want to check data type so use /is/

        //     if (state is InternetGainedState) {
        //       return const Text("You are Connected !");
        //     } else if (state is InternetLostState) {
        //       return const Text("You are not connected !");
        //     } else {
        //       return const Text("Loading...");
        //     }
        //   },
        // ),
      ),
    );
  }
}
