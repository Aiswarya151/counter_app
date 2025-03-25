import 'package:counter_app/features/counter/model/counter_model.dart';
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
