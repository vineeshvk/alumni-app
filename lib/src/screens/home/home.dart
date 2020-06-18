import 'package:alumni_app/src/screens/chat/chat.dart';
import 'package:alumni_app/src/screens/feed/feed.dart';
import 'package:alumni_app/src/screens/profile/profile.dart';
import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  List<Widget> _screenList = List<Widget>();

  @override
  initState() {
    print("recreating main");
    _screenList.addAll([EventScreen(), ChatScreen(), ProfileScreen()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screenList[_selectedTab],
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
  }
}
