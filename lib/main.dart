import 'package:chat_app/Cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/Cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/Cubits/register_cubit/register_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/ChatPage.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const scholarApp());
}

class scholarApp extends StatelessWidget {
  const scholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit())
      ],
      child: MaterialApp(
        routes: {
          loginPage.id: (context) => loginPage(),
          registerPage.id: (context) => registerPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: loginPage.id,
      ),
    );
  }
}
