import 'package:counter_app/features/authentication/viewmodel/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        title: const Text('Sign Up'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
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
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return TextField(
                  controller: confirmPasswordController,

                  obscureText: authProvider.isObscure,

                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        authProvider.changeObscure();
                      },
                      child: Icon(
                        authProvider.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthProvider>().signUp(
                  context: context,
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: Text("Sign Up"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.pushNamed('loginScreen');
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}