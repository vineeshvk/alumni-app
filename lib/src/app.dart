import 'package:alumni_app/src/authentication-bloc/user-repository.dart';
import 'package:alumni_app/src/constants/colors.dart';
import 'package:alumni_app/src/home/home.dart';
import 'package:alumni_app/src/login/login.dart';
import 'package:alumni_app/src/register/register.dart';
import 'package:alumni_app/src/splash/splash.dart';
import 'package:alumni_app/src/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: PRIMARY_DARK, // navigation bar color
      statusBarColor: PRIMARY_DARK, // status bar color
    ));

    return MaterialApp(
      theme: theme,
      routes: routes,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
    );
  }
}

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen()
};

final theme = ThemeData(
  fontFamily: "WorkSans",
  brightness: Brightness.dark,
  scaffoldBackgroundColor: PRIMARY_DARK,
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  buttonTheme: ButtonThemeData(
    height: 50,
    buttonColor: SECONDARY_DARK,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);

