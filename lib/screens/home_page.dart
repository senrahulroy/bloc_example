import 'package:blockexample/bloc/internet_bloc/internet_bloc.dart';
import 'package:blockexample/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Connected !"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Not Connected !"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("You are Connected !");
            } else if (state is InternetLostState) {
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
