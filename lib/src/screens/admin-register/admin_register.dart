import 'package:alumni_app/src/components/back_button.dart';
import 'package:alumni_app/src/components/error_message.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_bloc.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_event.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_state.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminRegisterScreen extends StatefulWidget {
  static const routeName = "/adminregister";
  @override
  _AdminRegisterScreenState createState() => _AdminRegisterScreenState();
}

class _AdminRegisterScreenState extends State<AdminRegisterScreen> {
  AdminRegisterBloc _adminRegisterBloc;

  @override
  void initState() {
    _adminRegisterBloc = BlocProvider.of<AdminRegisterBloc>(context);
    super.initState();
  }

  void _onRegisterPressed() {
    _adminRegisterBloc.add(AdminRegisterRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          children: <Widget>[
            CustomBackButton(left: 0),
            Container(height: 10),
            Text(
              StringResources.adminSignUpText,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            Text(
              StringResources.signUpToContinueText,
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
            controller: _adminRegisterBloc.emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          Container(height: 40),
          InputField(
            label: StringResources.passwordText,
            controller: _adminRegisterBloc.passwordController,
            obscureText: true,
          ),
          Container(height: 40),
          getDropDownField(),
          Container(height: 20),
          Expanded(child: Container()),
          BlocBuilder<AdminRegisterBloc, AdminRegisterState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state is AdminRegisterFailureState)
                    ErrorMessageWidget(message: state.error),
                  PrimaryButton.accent(
                    isLoading: state is AdminRegisterLoadingState,
                    text: StringResources.signInText.toUpperCase(),
                    onPressed: _onRegisterPressed,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget getDropDownField() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return DropdownButtonFormField<String>(
          onChanged: (d) {},
          items: [
            DropdownMenuItem<String>(
              value: "a",
              child: Text("A"),
            ),
            DropdownMenuItem<String>(
              value: "b",
              child: Text("B"),
            )
          ],
        );
      },
    );
  }
}
