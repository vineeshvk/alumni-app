import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/screens/home/bloc/app_bloc.dart';
import 'package:alumni_app/src/screens/home/home.dart';
import 'package:alumni_app/src/screens/login/bloc/login_bloc.dart';
import 'package:alumni_app/src/screens/login/login.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/register.dart';
import 'package:alumni_app/src/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case WelcomeScreen.routeName:
      return buildWelcomeScreen();
    case LoginScreen.routeName:
      return buildLoginScreen();
    case HomeScreen.routeName:
      return buildHomeScreen();
    case RegisterScreen.routeName:
      return buildRegisterScreen();
    default:
      return null;
  }
}

class PageBuilder {
  static Widget buildLoginScreenPage() {
    return BlocProvider<LoginBloc>(
      create: (context) {
        AuthenticationBloc authenticationBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        return LoginBloc(authenticationBloc);
      },
      child: LoginScreen(),
    );
  }

  static Widget buildHomeScreenPage() {
    print("from buildHome");
    return BlocProvider<AppBloc>(
      create: (context) {
        AuthenticationBloc authenticationBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        return AppBloc(authenticationBloc);
      },
      child: HomeScreen(),
    );
  }

  static Widget buildRegisterScreenPage() {
    return BlocProvider<RegisterBloc>(
        create: (context) {
          return RegisterBloc();
        },
        child: RegisterScreen());
  }

  static Widget buildWelcomeScreenPage() {
    return WelcomeScreen();
  }
}

MaterialPageRoute buildLoginScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildLoginScreenPage(),
    ),
  );
}

MaterialPageRoute buildWelcomeScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildWelcomeScreenPage(),
    ),
  );
}

MaterialPageRoute buildHomeScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildHomeScreenPage(),
    ),
  );
}

MaterialPageRoute buildRegisterScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildRegisterScreenPage(),
    ),
  );
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      print("State =============== $state");
      if (state is AuthenticationLoggedInState) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (v) => false);
      }
      if (state is AuthenticationLoggedOutState) {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (v) => false);
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        return widget;
      },
    ),
  );
}
