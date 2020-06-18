import 'package:alumni_app/routes.dart';
import 'package:alumni_app/src/utils/colors.dart';
import 'package:alumni_app/src/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: PRIMARY_DARK,
      statusBarColor: PRIMARY_DARK,
    ));

    return MaterialApp(
      theme: defaultTheme,
      onGenerateRoute: getRoute,
      debugShowCheckedModeBanner: false,
      home: addAuthBloc(context, Container()),
    );
  }
}
