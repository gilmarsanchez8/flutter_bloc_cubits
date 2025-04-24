import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit(){
    print('Submit: $state');
  }

  void username(String value) {
    emit(state.copyWith(username: value));
  }

  void email(String value) {
    emit(state.copyWith(email: value));
  }

  void password(String value) {
    emit(state.copyWith(password: value));
  }
}
