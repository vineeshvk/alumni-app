import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController ctrl = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Chats (with admin)",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (ctx, i) => Container(height: 15),
                  padding: EdgeInsets.all(40),
                  itemCount: messages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final rev = messages.reversed.toList();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              color: PRIMARY_DARK,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            rev[index],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      controller: ctrl,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (ctrl.text != "")
                        setState(() {
                          messages.add(ctrl.text);
                          ctrl.clear();
                        });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
