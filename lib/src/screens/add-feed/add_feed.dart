import 'package:alumni_app/src/components/back_button.dart';
import 'package:alumni_app/src/components/date_picker.dart';
import 'package:alumni_app/src/components/error_message.dart';
import 'package:alumni_app/src/components/input_field.dart';
import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_bloc.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_event.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_state.dart';
import 'package:alumni_app/src/screens/home/home.dart';
import 'package:alumni_app/src/utils/colors.dart';
import 'package:alumni_app/src/utils/string_resources.dart';
import 'package:flutter/cupertino.dart';
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

  void _onAddImageButtonPressed() {
    _addFeedBloc.add(AddImageEvent());
  }

  void _onSubmit() {
    _addFeedBloc.add(AddNewFeedEvent());
  }

  void _onDateInputTap() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomDatePicker(
        maxYear: 5040,
        onDateTimeChanged: (newDate) {
          _addFeedBloc.scheduledDateCtrl.value = TextEditingValue(
            text: newDate.toIso8601String().substring(0, 10),
          );
        },
      ),
    );
  }

  void _onFeedAddedSuccess(BuildContext context, AddFeedState state) {
    if (state is AddFeedSuccessState) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
          children: [
            CustomBackButton(left: 0, onPressed: _onBackButtonPressed),
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
              //TODO : set max year and something else. I don't remeber/
              label: StringResources.scheduledDateText,
              controller: _addFeedBloc.scheduledDateCtrl,
              onTap: _onDateInputTap,
            ),
            Container(height: 30),
            InputField(
              label: StringResources.contactText,
              controller: _addFeedBloc.contactCtrl,
              keyboardType: TextInputType.phone,
            ),
            Container(height: 30),
            InputField(
              label: StringResources.venueText,
              controller: _addFeedBloc.venueCtrl,
            ),
            getSelectImageWidget(),
            Container(height: 30),
            addFeedButtonWidget()
          ],
        ),
      ),
    );
  }

  Widget getSelectImageWidget() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 15, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
        border: Border.fromBorderSide(BorderSide()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BlocBuilder<AddFeedBloc, AddFeedState>(
            builder: (ctx, state) {
              if (state is AddImageLoadingState)
                return CupertinoActivityIndicator();

              return Container(
                width: 190,
                child: Text(
                  _addFeedBloc.imagePath ?? "Select Image",
                  maxLines: 1,
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
          FlatButton(
            textColor: SECONDARY_DARK,
            child: Text("ADD"),
            onPressed: _onAddImageButtonPressed,
          )
        ],
      ),
    );
  }

  Widget addFeedButtonWidget() {
    return BlocConsumer<AddFeedBloc, AddFeedState>(
      listener: _onFeedAddedSuccess,
      builder: (context, state) {
        return Column(
          children: [
            if (state is AddFeedFailureState)
              ErrorMessageWidget(message: state.error),
            PrimaryButton.accent(
              isLoading: state is AddFeedLoadingState,
              text: StringResources.addNewFeedText,
              onPressed: _onSubmit,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _addFeedBloc.titleCtrl.dispose();
    _addFeedBloc.venueCtrl.dispose();
    _addFeedBloc.contactCtrl.dispose();
    _addFeedBloc.descriptionCtrl.dispose();
    _addFeedBloc.scheduledDateCtrl.dispose();

    _addFeedBloc.close();
    super.dispose();
  }
}
