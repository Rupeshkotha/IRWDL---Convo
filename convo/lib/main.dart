import 'package:convo/Features/Landing/Screens/landing_screen.dart';
import 'package:convo/firebase_options.dart';
import 'package:convo/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:convo/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:convo/screens/mobile_layout_screen.dart';
import 'package:convo/utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Convo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute: (settings)=> generateRoute(settings),
      home: const LandingScreen(),
    );
  }
}
