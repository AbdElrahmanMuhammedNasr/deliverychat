import 'package:flutter/material.dart';
import 'package:flutter_main_app/chat/singleMsg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat extends StatefulWidget {
  String image;
  String name;
  String userNumber;
  String id;

  Chat({this.image, this.name, this.userNumber, this.id});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String _message;
  String _senderPhone;

  _getUserData () async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _senderPhone = pref.getString('phone');
  }

  @override
  Widget build(BuildContext context) {
    _getUserData ();
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            children: [
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('${widget.image}'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                '${widget.name}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Connect',
                                style: TextStyle(color: Colors.lightGreen),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print('setting');
                      },
                    )
                  ],
                ),
              ),
              ///////////////////////////////////////////////
              Container(child: Expanded(child: new SingleMessage())),

              ///////////////////////////////////////////////
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          final messageObj = {
                            "sender": _senderPhone,
                            "receiver": widget.userNumber,
                            "message": _message
                          };
                          print(messageObj);
                            setState(() {
                              _message = "";
                            });
                        }),
                    new Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "  Message",
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              _message = val;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
