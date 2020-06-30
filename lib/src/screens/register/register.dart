import 'package:alumni_app/src/components/back_button.dart';
import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_account.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_college.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_college_batch.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_personal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  void _onBackButtonPressed() {
    if (_registerBloc.pageCtrl.page == 0) {
      Navigator.pop(context);
      return;
    }

    _registerBloc.pageCtrl.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Future<bool> _onWillPop() async {
    if (_registerBloc.pageCtrl.page == 0.0) return true;
    _registerBloc.pageCtrl.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              CustomBackButton(onPressed: _onBackButtonPressed),
              Container(
                height: screenSize.height * 0.8,
                child: PageView(
                  controller: _registerBloc.pageCtrl,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    RegisterAccount(),
                    RegisterPersonal(),
                    RegisterCollege(),
                    RegisterCollegeBatch(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.emailCtrl.dispose();
    _registerBloc.dobCtrl.dispose();
    _registerBloc.passwordCtrl.dispose();
    _registerBloc.nameCtrl.dispose();
    _registerBloc.phoneCtrl.dispose();
    _registerBloc.genderCtrl.dispose();
    _registerBloc.collegeCtrl.dispose();
    _registerBloc.registerNoCtrl.dispose();
    _registerBloc.batchCtrl.dispose();
    _registerBloc.majorCtrl.dispose();
    _registerBloc.degreeCtrl.dispose();
    _registerBloc.close();

    super.dispose();
  }
}
