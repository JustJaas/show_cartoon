import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_cartoon/ui/blocs/login/login_bloc.dart';
import 'package:show_cartoon/ui/pages/login_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const AppBarWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            context.read<LoginBloc>().add(const LogOut());
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
