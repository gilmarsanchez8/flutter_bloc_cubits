import 'package:flutter_application_formsapp/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => CubitCounterScreen(),
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => BlocCounterScreen(),
    )
  ],
);
