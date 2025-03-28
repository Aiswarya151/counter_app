import 'package:counter_app/core/router/router.dart';
import 'package:counter_app/core/theme/theme.dart';
import 'package:counter_app/features/authentication/viewmodel/auth_provider.dart';
import 'package:counter_app/features/counter/viewmodel/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => CounterProvider()),
         ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(
      
        ),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}