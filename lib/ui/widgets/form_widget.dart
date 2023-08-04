import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:show_cartoon/ui/blocs/login/login_bloc.dart';
import 'package:show_cartoon/ui/pages/home_page.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.validate) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
        if (loginBloc.state.error) {
          loginBloc.add(const ChangeError());
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: loginBloc.state.errorMessage == ""
                ? "Ingrese usuario y contraseña"
                : loginBloc.state.errorMessage,
          );
        }
      },
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              key: const Key("user_input"),
              autocorrect: false,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                loginBloc.add(GetUser(user: value));
              },
              decoration: const InputDecoration(
                  hintText: "Usuario", labelText: "Usuario"),
              validator: (value) {
                return (value!.isNotEmpty && value.length >= 2)
                    ? null
                    : 'El usuario debe de ser minimo de 2 caracteres';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("password_input"),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                loginBloc.add(GetPassword(password: value));
              },
              decoration: const InputDecoration(
                  hintText: "Contraseña", labelText: "Contraseña"),
              validator: (value) {
                return (value!.isNotEmpty && value.length >= 6)
                    ? null
                    : 'La contrasela debe de ser minimo de 6 caracteres';
              },
            ),
            const SizedBox(height: 50),
            MaterialButton(
                key: const Key("button_login"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                color: Colors.teal,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text(
                    "Ingresar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    loginBloc.add(const SingIn());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
