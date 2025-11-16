import 'package:go_router/go_router.dart';

// // --- Authentication
import '../../ui/auth/login/screen/login_screen.dart';
// import '../../ui/auth/password/screen/password_screen.dart';
// import '../../ui/auth/register/screen/register_screen.dart';
// import '../../ui/auth/reset/screen/reset_screen.dart';
// import '../../ui/auth/term/term_screen.dart';
// import '../../ui/auth/updated/updated_screen.dart';
// import '../../ui/auth/verified/screen/verified_screen.dart';
//
// // --- Features
// import '../../ui/features/home/home_screen.dart';
// import '../../ui/features/profile/profile_screen.dart';
// import '../../ui/features/report/report_screen.dart';
// import '../../ui/features/task/task_screen.dart';

// --- Startup
import '../../ui/features/detail/screen/detail_screen.dart';
import '../../ui/introduction/splash/screen/splash_screen.dart';
import '../../ui/main/screen/main_screen.dart';
import '../model/book_model.dart';
// import '../../ui/introduction/welcome/screen/welcome_screen.dart';

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

  // --- Features
  static const String main = '/main';
  static const String home = '/home';
  static const String report = '/history';
  static const String profile = '/profile';

  // --- iNews
  static const String inews = '/inews';
  static const String inewsDetail = '/inews/:id';
  static const String inewsAdd = '/inews/add';

  static final routes = <GoRoute>[
    // --- Startup
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashScreen(),
    ),
    // GoRoute(
    //   path: welcome,
    //   builder: (context, state) => const WelcomeScreen(),
    // ),
    //
    // // --- Authentication
    GoRoute(
      path: login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: main,
      builder: (context, state) => const MainScreen(),
    ),
    // --- Book Detail
    GoRoute(
      path: '/book',
      builder: (context, state) {
        final BookModel book = state.extra as BookModel;
        return DetailScreen(book: book);
      },
    ),
    // GoRoute(
    //   path: register,
    //   builder: (context, state) => const RegisterScreen(),
    // ),
    // GoRoute(
    //   path: term,
    //   builder: (context, state) => const TermScreen(),
    // ),
    // GoRoute(
    //   path: reset,
    //   builder: (context, state) => const ResetScreen(),
    // ),
    // GoRoute(
    //   path: verified,
    //   builder: (context, state) => const VerifiedScreen(
    //     maskedEmail: '',
    //   ),
    // ),
    // GoRoute(
    //   path: password,
    //   builder: (context, state) => const PasswordScreen(),
    // ),
    // GoRoute(
    //   path: updated,
    //   builder: (context, state) => const UpdatedScreen(),
    // ),
    //
    // // --- Features
    // GoRoute(
    //   path: home,
    //   builder: (context, state) => const HomeScreen(),
    // ),
    // GoRoute(
    //   path: academic,
    //   builder: (context, state) => const TaskScreen(),
    // ),
    // GoRoute(
    //   path: report,
    //   builder: (context, state) => const ReportScreen(),
    // ),
    // GoRoute(
    //   path: profile,
    //   builder: (context, state) => const ProfileScreen(),
    // ),
  ];
}
