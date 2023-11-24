import 'package:blockexample/screens/form_validation/bloc/sign_in_event.dart';
import 'package:blockexample/screens/form_validation/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Invalid email !"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("please enter valid password"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}

// class SignInInitial {}
