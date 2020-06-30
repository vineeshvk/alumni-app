import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/screens/chat/chat.dart';
import 'package:alumni_app/src/screens/feed/bloc/feed_bloc.dart';
import 'package:alumni_app/src/screens/feed/feed.dart';
import 'package:alumni_app/src/screens/profile/bloc/profile_bloc.dart';
import 'package:alumni_app/src/screens/profile/profile.dart';
import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  List<Widget> _screenList;

  initState() {
    _screenList = [
      BlocProvider(create: (ctx) => FeedBloc(), child: FeedScreen()),
      ChatScreen(),
      BlocProvider(
        child: ProfileScreen(),
        create: (ctx) => ProfileBloc(
          BlocProvider.of<AuthenticationBloc>(context),
        ),
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screenList[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedTab,
          selectedItemColor: PRIMARY_DARK,
          unselectedItemColor: Colors.black26,
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
