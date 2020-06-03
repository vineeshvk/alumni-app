import 'package:alumni_app/src/register/bloc/register_bloc.dart';
import 'package:alumni_app/src/register/bloc/register_state.dart';
import 'package:alumni_app/src/register/form-pages/register_account.dart';
import 'package:alumni_app/src/register/form-pages/register_college.dart';
import 'package:alumni_app/src/register/form-pages/register_college_batch.dart';
import 'package:alumni_app/src/register/form-pages/register_personal.dart';
import 'package:alumni_app/src/register/register_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageController extends StatelessWidget {
  final int page;

  final Map<String, String> inputs;

  final void Function(String, String) onInputTextChange;

  final void Function(int) onPageChanged;
  final void Function(BuildContext) onBackButtonPressed;
  final void Function(BuildContext) onRegisterButtonPressed;
  final void Function(BuildContext) onContinueButtonPressed;

  final PageController pageController;

  const RegisterPageController({
    Key key,
    this.onPageChanged,
    this.pageController,
    this.page,
    this.onBackButtonPressed,
    this.onRegisterButtonPressed,
    this.onContinueButtonPressed,
    this.onInputTextChange,
    this.inputs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.all(32),
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: BackButton(
            onPressed: () => onBackButtonPressed(context),
          ),
        ),
        Container(
          height: screenSize.height * 0.7,
          child: PageView(
            onPageChanged: onPageChanged,
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              RegisterAccount(onInputTextChange: onInputTextChange),
              RegisterPersonal(
                  onInputTextChange: onInputTextChange, inputs: inputs),
              RegisterCollege(onInputTextChange: onInputTextChange),
              RegisterCollegeBatch(onInputTextChange: onInputTextChange)
            ],
          ),
        ),
        BlocListener<RegisterBloc, RegisterState>(
          bloc: BlocProvider.of<RegisterBloc>(context),
          child: RegisterButtons(
            registerComplete: page == 3,
            onContinueButtonPressed: onContinueButtonPressed,
            onRegisterButtonPressed: onRegisterButtonPressed,
          ),
          listener: (context, state) {
            if (state is EmailDoesNotExist) {
              pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
        )
      ],
    );
  }
}
