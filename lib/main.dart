// ignore_for_file: must_be_immutable

import 'package:chat/constant.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_cubit.dart';
import 'package:chat/features/auth/presentation/views/phone_view.dart';
import 'package:chat/features/home/presentaion/views/home_view.dart';
import 'package:chat/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final auth = FirebaseAuth.instance.currentUser;
    return BlocProvider(
      create: (context) => PhoneVerifyCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // routerConfig:auth == null? AppRouter.router:AppRouter.goHomeRouter,
        home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) =>
            snapshot.hasData ? const HomwView() : const PhoneView(),
      ),
      

        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimeColor),
      ),
    );
  }
}
