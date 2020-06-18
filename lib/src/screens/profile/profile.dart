import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthenticationBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: PrimaryButton(
                text: "LOG OUT",
                onPressed: () {
                  _authBloc.add(AuthenticationLoggedOutEvent());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }
}
