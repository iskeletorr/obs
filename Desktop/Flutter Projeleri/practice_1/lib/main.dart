import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home/exchange_rate/country_list.dart';
import 'home/hotel_deals/explore.dart';
import 'home/hotel_deals/favorites.dart';
import 'home/hotel_deals/settings.dart';
import 'home/login_and_signup/forgot_screen.dart';
import 'home/login_and_signup/login_screen.dart';
import 'home/tdk_resdesign/desc_screen.dart';
import 'home/tdk_resdesign/onboard_screen.dart';
import 'home/tdk_resdesign/welcome_screen.dart';
import 'home/users/user_list.dart';
import 'model/rate_model.dart';
import 'home/login_and_signup/signup_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Hive.initFlutter();
  Hive.registerAdapter(RateModelAdapter());
  await Hive.openBox('currencyRates');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => const LoginScreen(),
        // '/signup': (context) => const SignupScreen(),
        // '/forgot': (context) => const ForgotScreen(),
        '/': (context) => const OnboardScreen(),
        '/desc': (context) => const DescScreen(),
        '/welcome' :(context) => const WelcomeScreen(),
        // '/explore': (context) => const Explore(),
        // '/favorites': (context) => const Favorites(),
        // '/settings': (context) => const Settings(),
      },
      //  home: Explore(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
