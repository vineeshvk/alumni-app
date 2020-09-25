import 'package:alumni_app/src/components/primary_button.dart';
import 'package:alumni_app/src/models/user.dart';
import 'package:alumni_app/src/screens/profile/bloc/profile_bloc.dart';
import 'package:alumni_app/src/screens/profile/bloc/profile_event.dart';
import 'package:alumni_app/src/utils/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Scaffold(
          body: FutureBuilder(
            future: PreferenceHelper.getToken(),
            builder: (ctx, snapshot) {
              User user = snapshot.data;
              if (snapshot.hasData) {
                if (user.id != null)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(height: 60),
                      Text("Name", style: style),
                      Text(user.name),
                      Container(height: 30),
                      Text("Email", style: style),
                      Text(user.email),
                      Container(height: 30),
                      Expanded(child: Container()),
                      Center(
                        child: PrimaryButton(
                          text: "LOG OUT",
                          onPressed: () {
                            _profileBloc.add(ProfileLogoutEvent());
                          },
                        ),
                      )
                    ],
                  );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }
}
