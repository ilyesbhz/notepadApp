import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notepad_app/provider/provider.dart';
import 'package:notepad_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAmHemcZLL7WCw-Mw5Yzl2d6mSEtJZ3X6k",
    authDomain: "notepad-bcbb4.firebaseapp.com",
    projectId: "notepad-bcbb4",
    storageBucket: "notepad-bcbb4.appspot.com",
    messagingSenderId: "333307505208",
    appId: "1:333307505208:web:542dc49ef71b8f654a94cd",
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          //default
          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
          //custom
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
