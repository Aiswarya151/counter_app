import 'package:counter_app/features/authentication/presentation/login_screen.dart';
import 'package:counter_app/features/authentication/presentation/sign_up_screen.dart';
import 'package:counter_app/features/counter/data/model/counter_model.dart';
import 'package:counter_app/features/counter/presentation/screens/counter_detail_screen.dart';
import 'package:counter_app/features/counter/presentation/screens/counter_screen.dart';
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
      path: '/signUpScreen',
      name: 'signUpScreen',
      builder: (context, state) {
        return SignUpScreen();
      },
    ),
     GoRoute(
      path: '/loginScreen',
      name: 'loginScreen',
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/counter',
      name: 'counter',
      builder: (context, state) => CounterScreen(),
    ), 
     GoRoute(
      path: '/counterdetail',
      name: 'counterdetail',
      
      builder: (context, state) {final counter=state.extra as Counter;
      return CounterDetailScreen(counter: counter,);}
    ), // GoRoute
  ],
); // GoRouter
