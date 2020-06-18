import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_state.dart';
import 'package:alumni_app/src/screens/home/home.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthenticationBloc _authBloc;

  @override
  initState() {
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    super.initState();
  }

  Future<bool> _onWillPop(context) async {
    RegisterBloc _registerBloc = BlocProvider.of<RegisterBloc>(context);

    if (_registerBloc.pageCtrl.page == 0.0) return true;

    _registerBloc.pageCtrl.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    _registerBloc.close();

    return false;
  }

  void _onRegistrationSuccess(BuildContext context, AuthenticationState state) {
    print("from register $state");
    if (state is AuthenticationLoggedInState)
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (val) => false,
      );
  }

  RegisterBloc _registerCreateBloc(BuildContext context) {
    return RegisterBloc(
      authenticationBloc: _authBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegisterBloc>(
        create: _registerCreateBloc,
        child: WillPopWidget(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: BlocListener<AuthenticationBloc, AuthenticationState>(
              bloc: _authBloc,
              listener: _onRegistrationSuccess,
              child: RegisterPageController(),
            ),
          ),
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

//Inorder to get the context with registerBloc
class WillPopWidget extends StatelessWidget {
  final Widget child;
  final Future<bool> Function(BuildContext) onWillPop;

  const WillPopWidget({Key key, this.onWillPop, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: child, onWillPop: () => onWillPop(context));
  }
}
