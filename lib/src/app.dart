import 'package:alumni_app/src/bloc/authentication-bloc.dart';
import 'package:alumni_app/src/constants/colors.dart';
import 'package:alumni_app/src/repositories/user-repository.dart';
import 'package:alumni_app/src/screens/login.dart';
import 'package:alumni_app/src/screens/splash.dart';
import 'package:alumni_app/src/screens/welcome.dart';
import 'package:alumni_app/src/states/authentication-state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        // routes: routes,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return SplashScreen();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginScreen(userRepository: userRepository);
            }
            if (state is AuthenticationLoading) {
              return CupertinoActivityIndicator();
            }
            return SplashScreen();
          },
        ));
  }
}

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
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
