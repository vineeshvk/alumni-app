import 'package:alumni_app/src/components/back_button.dart';
import 'package:alumni_app/src/components/error_message.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/login/bloc/login_bloc.dart';
import 'package:alumni_app/src/screens/login/bloc/login_event.dart';
import 'package:alumni_app/src/screens/login/bloc/login_state.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  void _loginOnPress() {
    _loginBloc.add(LoginButtonPressedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
          children: <Widget>[
            CustomBackButton(left: 0),
            Container(height: 10),
            Text(
              StringResources.signInText,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            Text(
              StringResources.signInToContinueText,
              style: TextStyle(fontSize: 24, color: Colors.black38),
            ),
            getTextFormWidget(),
          ],
        ),
      ),
    );
  }

  Widget getTextFormWidget() {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.55,
      child: Column(
        children: <Widget>[
          Container(height: 60),
          InputField(
            label: StringResources.emailText,
            controller: _loginBloc.emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          Container(height: 40),
          InputField(
            label: StringResources.passwordText,
            controller: _loginBloc.passwordController,
            obscureText: true,
          ),
          Expanded(child: Container()),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Column(children: [
                if (state is LoginFailureState)
                  ErrorMessageWidget(message: state.error),
                PrimaryButton.accent(
                  isLoading: state is LoginLoadingState,
                  text: StringResources.signInButtonText,
                  onPressed: _loginOnPress,
                ),
              ]);
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    _loginBloc.emailController.dispose();
    _loginBloc.passwordController.dispose();
    super.dispose();
  }
}
