import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String _message;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            backgroundImage: AssetImage('images/3.jpeg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Tamer',
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
              Container(
                
              ),

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
                          print("send");
                          print(_message);
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
