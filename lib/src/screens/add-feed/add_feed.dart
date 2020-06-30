import 'package:alumni_app/src/components/back_button.dart';
import 'package:alumni_app/src/components/date_picker.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_bloc.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_event.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFeedScreen extends StatefulWidget {
  static const routeName = "/addfeed";

  @override
  _AddFeedScreenState createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  AddFeedBloc _addFeedBloc;

  @override
  void initState() {
    _addFeedBloc = BlocProvider.of<AddFeedBloc>(context);
    super.initState();
  }

  void _onBackButtonPressed() {
    Navigator.pop(context);
  }

  void _onSubmit() {
    _addFeedBloc.add(AddNewFeedEvent());
  }

  void _onDateInputTap() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomDatePicker(
        onDateTimeChanged: (newDate) {
          _addFeedBloc.scheduledDateCtrl.value = TextEditingValue(
            text: newDate.toIso8601String().substring(0, 10),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
          children: [
            CustomBackButton(left: 0),
            Container(height: 30),
            Text(
              StringResources.newFeedText,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(height: 30),
            InputField(
              label: StringResources.titleText,
              controller: _addFeedBloc.titleCtrl,
            ),
            Container(height: 30),
            InputField.multiLine(
              label: StringResources.descriptionText,
              controller: _addFeedBloc.descriptionCtrl,
            ),
            Container(height: 30),
            InputField(
              label: StringResources.imageText,
              controller: _addFeedBloc.imageCtrl,
            ),
            Container(height: 30),
            InputField(
              //TODO : set max year and something else. I don't remeber/
              label: StringResources.scheduledDateText,
              controller: _addFeedBloc.scheduledDateCtrl,
              onTap: _onDateInputTap,
            ),
            Container(height: 30),
            InputField(
              label: StringResources.contactText,
              controller: _addFeedBloc.contactCtrl,
            ),
            Container(height: 30),
            InputField(
              label: StringResources.venueText,
              controller: _addFeedBloc.venueCtrl,
            ),
            Container(height: 30),
            PrimaryButton.accent(
              text: StringResources.addNewFeedText,
              onPressed: _onSubmit,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addFeedBloc.titleCtrl.dispose();
    _addFeedBloc.venueCtrl.dispose();
    _addFeedBloc.imageCtrl.dispose();
    _addFeedBloc.contactCtrl.dispose();
    _addFeedBloc.descriptionCtrl.dispose();
    _addFeedBloc.scheduledDateCtrl.dispose();

    _addFeedBloc.close();
    super.dispose();
  }
}
