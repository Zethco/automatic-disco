import 'package:go_router/go_router.dart';

import '../ui/pages/home/home_page.dart';
import '../ui/pages/login/login_page.dart';
import '../ui/pages/sign_up/sign_up_page.dart';
import '../ui/pages/splash/splash_page.dart';

class Routers {
  static GoRouter authRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'signUp',
        path: '/signUp',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
