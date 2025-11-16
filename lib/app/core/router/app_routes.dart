import 'package:go_router/go_router.dart';
import '../../ui/auth/login/screen/login_screen.dart';
import '../../ui/features/detail/screen/detail_screen.dart';
import '../../ui/introduction/splash/screen/splash_screen.dart';
import '../../ui/main/screen/main_screen.dart';
import '../model/book_model.dart';

abstract class AppRoutes {
  // --- Startup
  static const String splash = '/';
  static const String welcome = '/welcome';

  // --- Authentication
  static const String login = '/login';
  static const String register = '/register';
  static const String term = '/term';
  static const String reset = '/reset';
  static const String verified = '/verified';
  static const String password = '/password';
  static const String updated = '/updated';

  // --- Main Features
  static const String main = '/main';
  static const String home = '/home';
  static const String report = '/history';
  static const String profile = '/profile';

  // --- iNews
  static const String inews = '/inews';
  static const String inewsDetail = '/inews/:id';
  static const String inewsAdd = '/inews/add';

  // --- Route List
  static final routes = <GoRoute>[
    // Splash
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // Login
    GoRoute(
      path: login,
      builder: (context, state) => const LoginScreen(),
    ),

    // Main Screen (Bottom Nav)
    GoRoute(
      path: main,
      builder: (context, state) => const MainScreen(),
    ),

    // Book Detail
    GoRoute(
      path: '/book',
      builder: (context, state) {
        final BookModel book = state.extra as BookModel;
        return DetailScreen(book: book);
      },
    ),
  ];
}
