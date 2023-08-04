import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

const String username = "user";
const String password = "123456";

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(
          usernameTemp: "",
          passwordTemp: "",
          validate: false,
          errorMessage: "",
          error: false,
        )) {
    on<GetUser>((event, emit) {
      emit(state.copyWith(
        usernameTemp: event.user,
      ));
    });

    on<GetPassword>((event, emit) {
      emit(state.copyWith(
        passwordTemp: event.password,
      ));
    });

    on<SingIn>((event, emit) {
      if (username != state.usernameTemp) {
        emit(state.copyWith(
          validate: false,
          errorMessage: "Usuario incorrecto",
          error: true,
        ));
        return;
      }

      if (password != state.passwordTemp) {
        emit(state.copyWith(
          validate: false,
          errorMessage: "Contraseña incorrecta",
          error: true,
        ));
        return;
      }

      emit(state.copyWith(validate: true, error: false));
    });

    on<LogOut>((event, emit) {
      emit(state.copyWith(validate: false));
    });

    on<ChangeError>((event, emit) {
      emit(state.copyWith(error: !state.error));
    });
  }
}
