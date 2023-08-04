import 'package:flutter/material.dart';
import 'package:show_cartoon/ui/widgets/form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 50,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FormWidget(),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
