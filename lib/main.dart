import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:show_cartoon/ui/blocs/cartoon/cartoon_bloc.dart';
import 'package:show_cartoon/ui/pages/splash_page.dart';

import 'ui/blocs/login/login_bloc.dart';

void main() async {
  await dotenv.load(
    fileName: '.env',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartoonBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cartoon Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: false,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
