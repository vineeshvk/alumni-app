import 'package:alumni_app/src/chat/chat.dart';
import 'package:alumni_app/src/constants/colors.dart';
import 'package:alumni_app/src/events/bloc/event_item_bloc.dart';
import 'package:alumni_app/src/events/bloc/event_item_repository.dart';
import 'package:alumni_app/src/events/events.dart';
import 'package:alumni_app/src/profile/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tab = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final eventRepo = EventItemRepository(dio: dio);

    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => EventItemBloc(eventRepo: eventRepo),
          ),
        ],
        child: Scaffold(
          body: [EventScreen(), ChatScreen(), ProfileScreen()][tab],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: PRIMARY_DARK,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: tab,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blueGrey,
            onTap: (t) => setState(() {
              tab = t;
            }),
            items: [
              BottomNavigationBarItem(
                icon: Icon(OMIcons.home),
                title: Text('Home'),
                activeIcon: Icon(Icons.home),
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
      ),
    );
  }
}
