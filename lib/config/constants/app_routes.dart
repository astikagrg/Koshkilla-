import '../../features/auth/presentation/view/login.dart';
import '../../features/auth/presentation/view/register.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/splash/presentation/view/splash_screen.dart';

class AppRoute {
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String splashRoute = '/';

  static getApplicationRoute() {
    return {
      AppRoute.splashRoute: (context) => const SplashScreen(),
      AppRoute.loginRoute: (context) => const LoginScreen(),
      AppRoute.registerRoute: (context) => const RegisterScreen(),
      AppRoute.homeRoute: (context) => const HomeView(),
    };
  }
}
