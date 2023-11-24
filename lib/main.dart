import 'package:blockexample/bloc/internet_bloc/internet_bloc.dart';
import 'package:blockexample/cubit/internet_cubit.dart';
import 'package:blockexample/screens/cubit_page.dart';
import 'package:blockexample/screens/form_validation/bloc/sign_in_bloc.dart';
import 'package:blockexample/screens/form_validation/sign_in.dart';
import 'package:blockexample/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mobile_auth/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      // InternetBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Bloc'),
        // home: const CubitExample(title: 'Cubit'),
        // home: BlocProvider(
        //   create: (context) => SignInBloc(),
        //   child: SignInPage(),
        // ),
        home: const SignInMobileOtp(),
      ),
    );
  }
}
