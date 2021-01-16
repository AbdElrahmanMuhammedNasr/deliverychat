import 'package:flutter/material.dart';
import 'package:flutter_main_app/chats/singleUser.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  String _search;
  List<int> user = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.black.withOpacity(0.7),
          child: Column(
            children: [
              Text(
                "Chats",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "  Search...",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                      ),
                      onSaved: (val) {
                        _search = val;
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                      onPressed: () {
                        print('new message');
                      },
                      child: Text(
                        "New Message",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                  FlatButton(
                      onPressed: () {
                        print('new group');
                      },
                      child: Text(
                        "New Group",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: user
                        .map((e) => new SingleUser(
                              image: 'images/3.jpeg',
                              name: 'Tamer Ali',
                              lastMessage: "come ASAP",
                              date: '3:20',
                              numberOfMessahe: 20,
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
