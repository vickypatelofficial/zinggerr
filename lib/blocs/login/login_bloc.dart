import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zinggerr/blocs/login/login_event.dart';
import 'package:zinggerr/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<PasswordVisibilityChanged>((event, emit) {
      emit(state.copyWith(isPasswordVisible: event.isVisible));
    });
  }
}
