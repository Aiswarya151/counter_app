import 'package:counter_app/features/authentication/viewmodel/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            TextField(
              controller: emailController,

              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,

              decoration: InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthProvider>().login(
                  context: context,
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: Text("Log In"),
            ),
              SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.pushNamed('signUpScreen');
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}