import 'package:chat/features/auth/presentation/views/phone_view.dart';
import 'package:chat/features/auth/presentation/views/verify_phone_number_view.dart';
import 'package:chat/features/home/presentation/view/home.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String phoneView = '/phoneView';
  static String verfiyPhoneNumberView = '/verfiyPhoneNumberView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/', //by default is initial router
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: phoneView, //by default is initial router
        builder: (context, state) =>  PhoneView(),
      ),
      GoRoute(
        path: verfiyPhoneNumberView, //by default is initial router
        builder: (context, state) =>  VerifyPhoneNumberView(),
      ),
    ],
  );
}
