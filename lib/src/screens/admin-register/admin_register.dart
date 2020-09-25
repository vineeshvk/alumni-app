import 'package:alumni_app/src/components/back_button.dart';
import 'package:alumni_app/src/components/bottom_sheet.dart';
import 'package:alumni_app/src/components/error_message.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/models/college_model.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_bloc.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_event.dart';
import 'package:alumni_app/src/screens/admin-register/admin-registerbloc/admin_register_state.dart';
import 'package:alumni_app/src/screens/admin-register/college-bloc/college_bloc.dart';
import 'package:alumni_app/src/screens/admin-register/college-bloc/college_event.dart';
import 'package:alumni_app/src/screens/admin-register/college-bloc/college_state.dart';
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
  CollegeBloc _collegeBloc;

  @override
  void initState() {
    _adminRegisterBloc = BlocProvider.of<AdminRegisterBloc>(context);
    _collegeBloc = BlocProvider.of<CollegeBloc>(context);

    _collegeBloc.add(GetCollegeEvent());
    super.initState();
  }

  void _onRegisterPressed() {
    _adminRegisterBloc.add(AdminRegisterRequestEvent());
  }

  void _onCollegeSelected(String collegeId) {
    _adminRegisterBloc.collegeId = collegeId;
  }

  void _onAddCollegeButtonPressed() {
    _collegeBloc.add(AddCollegeEvent());
  }

  void _onCollegeAddSuccess(context, CollegeState state) {
    if (state is AddCollegeSuccessState) {
      _collegeBloc.add(GetCollegeEvent());
      Navigator.pop(context);
    }
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
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CollegeBloc, CollegeState>(
      builder: (context, state) {
        List<CollegeModel> colleges = [];

        if (state is GetCollegeSuccessState) {
          colleges = state.colleges;
        }

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: size.width * 0.7,
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return DropdownButtonFormField<String>(
                    hint: Text("Select a college"),
                    items: colleges.map((e) {
                      return DropdownMenuItem<String>(
                        child: Text(e.name),
                        value: e.id,
                      );
                    }).toList(),
                    onChanged: _onCollegeSelected,
                  );
                },
              ),
            ),
            BlocListener<CollegeBloc, CollegeState>(
              listener: _onCollegeAddSuccess,
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => getBottomSheetWidget(),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

  Widget getBottomSheetWidget() {
    return BottomSheetComponent(
      title: "Add College",
      children: [
        Container(
          padding: EdgeInsets.all(40),
          child: InputField(
            label: "College name",
            controller: _collegeBloc.collegeController,
          ),
        ),
        // Expanded(child: Container()),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 100,
            margin: EdgeInsets.only(right: 40),
            child: PrimaryButton(
              text: "Submit",
              onPressed: _onAddCollegeButtonPressed,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _adminRegisterBloc.emailController.dispose();
    _adminRegisterBloc.passwordController.dispose();
    _adminRegisterBloc.close();

    _collegeBloc.collegeController.dispose();
    _collegeBloc.close();
    super.dispose();
  }
}
