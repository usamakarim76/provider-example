import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_1/Provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                authProvider.login(
                    email.text.toString(), password.text.toString());
              },
              child: authProvider.isLoading
                  ? CircularProgressIndicator()
                  : Text("Login"),
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 50))),
            )
          ],
        ),
      ),
    );
  }
}
