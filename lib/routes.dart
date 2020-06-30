import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/screens/add-feed/add_feed.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_bloc.dart';
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
    case AddFeedScreen.routeName:
      return buildAddFeedScreen();
    default:
      return null;
  }
}

class PageBuilder {
  static Widget buildLoginScreenPage() {
    return BlocProvider<LoginBloc>(
      create: (context) {
        return LoginBloc(BlocProvider.of<AuthenticationBloc>(context));
      },
      child: LoginScreen(),
    );
  }

  static Widget buildHomeScreenPage() {
    return HomeScreen();
  }

  static Widget buildRegisterScreenPage() {
    return BlocProvider<RegisterBloc>(
      create: (context) {
        return RegisterBloc(BlocProvider.of<AuthenticationBloc>(context));
      },
      child: RegisterScreen(),
    );
  }

  static Widget buildWelcomeScreenPage() {
    return WelcomeScreen();
  }

  static Widget buildAddFeedScreenPage() {
    return BlocProvider<AddFeedBloc>(
      create: (context) => AddFeedBloc(),
      child: AddFeedScreen(),
    );
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

MaterialPageRoute buildAddFeedScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(
      context,
      PageBuilder.buildAddFeedScreenPage(),
    ),
  );
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      if (state is AuthenticationLoggedInState) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (v) => false);
      }
      if (state is AuthenticationLoggedOutState) {
        Navigator.pushNamedAndRemoveUntil(
            context, WelcomeScreen.routeName, (v) => false);
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
