import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/register/bloc/register_event.dart';
import 'package:alumni_app/src/register/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _pageCtrl = PageController();
  int page = 0;
  Map<String, String> inputs = {
    "email": "",
    "dob": "",
    "password": "",
    "name": "",
    "phone": "",
    "gender": "",
    "collegeId": "",
    "registerNo": "",
    "batch": "",
    "major": "",
    "degree": ""
  };

  Future<bool> _onWillPop() async {
    if (page == 0) return true;

    _pageCtrl.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    return false;
  }

  void _onInputTextChanged(String name, String text) {
    setState(() {
      inputs[name] = text;
    });
    print("inputs => $inputs");
  }

  void _onContinueButtonPressed(context) {
    if (page == 0) {
      BlocProvider.of<RegisterBloc>(context)
          .add(EmailExistCheck(email: inputs["email"]));
      return;
    }

    print("_onContinueButtonPressed $page");
    _pageCtrl.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onBackButtonPressed(context) {
    if (page == 0) {
      Navigator.pop(context);
      return;
    }

    _pageCtrl.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onRegisterButtonPressed(context) {
    BlocProvider.of<RegisterBloc>(context)
        .add(RegisterButtonPressed(inputs: inputs));
  }

  void _onPageChanged(int) {
    setState(() {
      page = int;
    });
  }

  RegisterBloc _registerCreateBloc(context) {
    // ignore: close_sinks
    final _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return RegisterBloc(
      userRepository: _authBloc.userRepository,
      authenticationBloc: _authBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: BlocProvider<RegisterBloc>(
            create: _registerCreateBloc,
            child: RegisterPageController(
              page: page,
              inputs: inputs,
              pageController: _pageCtrl,
              onPageChanged: _onPageChanged,
              onBackButtonPressed: _onBackButtonPressed,
              onContinueButtonPressed: _onContinueButtonPressed,
              onRegisterButtonPressed: _onRegisterButtonPressed,
              onInputTextChange: _onInputTextChanged,
            ),
          ),
        ),
      ),
    );
  }
}
