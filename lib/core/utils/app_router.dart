import 'package:chat/features/auth/presentation/views/continue_view.dart';
import 'package:chat/features/auth/presentation/views/phone_view.dart';
import 'package:chat/features/auth/presentation/views/profile_view.dart';
import 'package:chat/features/auth/presentation/views/verify_phone_number_view.dart';
import 'package:chat/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String phoneView = '/phoneView';
  static String verfiyPhoneNumberView = '/verfiyPhoneNumberView';
  static String continueView = '/continueView';
  static String profileView = '/profileView';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/', //by default is initial router
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: phoneView, //by default is initial router
        builder: (context, state) => PhoneView(),
      ),
      GoRoute(
        path: verfiyPhoneNumberView, //by default is initial router
        builder: (context, state) => VerifyPhoneNumberView(),
      ),
      GoRoute(
        path: continueView, //by default is initial router
        builder: (context, state) => const ContinueView(),
      ),
      GoRoute(
        path: profileView, //by default is initial router
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
