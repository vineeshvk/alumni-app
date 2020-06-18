import 'package:alumni_app/src/components/primary_button_light.dart';
import 'package:alumni_app/src/screens/home/bloc/app_bloc.dart';
import 'package:alumni_app/src/screens/home/bloc/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  // List<Widget> _screenList = List<Widget>();
  AppBloc _appBloc;

  @override
  initState() {
    print("recreating main");
    // _screenList.addAll([EventScreen(), ChatScreen(), ProfileScreen()]);
    super.initState();
    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(children: [
        PrimaryButtonLight(
          text: "logout",
          onPressed: () {
            _appBloc.add(LogoutButtonPressedEvent());
          },
        )
      ]),
    );
  }

  // @override
  /* Widget builds(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: _screenList[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: PRIMARY_DARK,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedTab,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
          onTap: (t) => setState(() {
            _selectedTab = t;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(OMIcons.event),
              title: Text('Events'),
              activeIcon: Icon(Icons.event),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.message),
              title: Text('Messages'),
              activeIcon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              icon: Icon(OMIcons.accountCircle),
              title: Text('Profile'),
              activeIcon: Icon(Icons.account_circle),
            )
          ],
        ),
      ),
    );
  }*/
}
