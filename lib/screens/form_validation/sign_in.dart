// ignore_for_file: must_be_immutable

import 'package:blockexample/screens/form_validation/bloc/sign_in_bloc.dart';
import 'package:blockexample/screens/form_validation/bloc/sign_in_event.dart';
import 'package:blockexample/screens/form_validation/bloc/sign_in_state.dart';
import 'package:blockexample/screens/form_validation/deshboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              if (state is SignInErrorState) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            }),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration:
                  const InputDecoration(hintText: 'Enter your email...'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(hintText: 'Enter password'),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey),
                    onPressed: () {
                      if (state is SignInValidState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DeshBoad()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Please check email & password"),
                          ),
                        );
                      }
                    },
                    child: const Text("Login"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
