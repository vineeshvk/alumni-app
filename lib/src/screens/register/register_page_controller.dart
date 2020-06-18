import 'package:alumni_app/src/screens/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/screens/register/bloc/register_event.dart';
import 'package:alumni_app/src/screens/register/bloc/register_state.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_account.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_college.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_college_batch.dart';
import 'package:alumni_app/src/screens/register/form-pages/register_personal.dart';
import 'package:alumni_app/src/screens/register/register_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageController extends StatefulWidget {
  @override
  _RegisterPageControllerState createState() => _RegisterPageControllerState();
}

class _RegisterPageControllerState extends State<RegisterPageController> {
  RegisterBloc _registerBloc;
  int page = 0;

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  void _onRegisterButtonPressed() {
    _registerBloc.add(RegisterButtonPressed());
  }

  void _onContinueButtonPressed() {
    if (_registerBloc.pageCtrl.page == 0) {
      _registerBloc.add(EmailExistCheck());
      return;
    }

    _registerBloc.pageCtrl.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onBackButtonPressed() {
    if (_registerBloc.pageCtrl?.page == 0) {
      Navigator.pop(context);
      return;
    }

    _registerBloc.pageCtrl.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _ifEmailNotExist(BuildContext context, RegisterState state) {
    if (state is EmailDoesNotExist) {
      _registerBloc.pageCtrl.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.all(32),
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: BackButton(onPressed: _onBackButtonPressed),
        ),
        Container(
          height: screenSize.height * 0.7,
          child: PageView(
            controller: _registerBloc.pageCtrl,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (p) => setState(() {
              page = p;
            }),
            children: <Widget>[
              RegisterAccount(registerBloc: _registerBloc),
              RegisterPersonal(registerBloc: _registerBloc),
              RegisterCollege(registerBloc: _registerBloc),
              RegisterCollegeBatch(registerBloc: _registerBloc)
            ],
          ),
        ),
        BlocListener<RegisterBloc, RegisterState>(
          listener: _ifEmailNotExist,
          bloc: _registerBloc,
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: _registerBloc,
            builder: (context, state) {
              //TODO: create  a new regsterBloc from context to use as page == 3
              return SizedBox(
                width: screenSize.width,
                child: Column(
                  children: <Widget>[
                    if (state is RegisterFailure)
                      Text(
                        state.error,
                        style: TextStyle(color: Colors.redAccent),
                      )
                    else
                      Container(height: 10),
                    RegisterButtons(
                      registerComplete: page == 3,
                      isLoading: state is RegisterLoading,
                      onContinueButtonPressed: _onContinueButtonPressed,
                      onRegisterButtonPressed: _onRegisterButtonPressed,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
