import 'package:counter_app/features/counter/counter_screen.dart';
import 'package:counter_app/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ), // GoRoute
    GoRoute(
      path: '/counter',
      name: 'counter',
      builder: (context, state) => CounterScreen(),
    ), // GoRoute
  ],
); // GoRouter
