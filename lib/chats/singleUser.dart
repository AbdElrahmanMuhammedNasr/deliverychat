import 'package:flutter/material.dart';
import 'package:flutter_main_app/chat/chat.dart';

class SingleUser extends StatefulWidget {
  String image;
  String name;
  String lastMessage;
  String date;
  int numberOfMessage;
  String userNumber;
  String id;

  SingleUser(
      {this.image,
      this.name,
      this.lastMessage,
      this.date,
      this.numberOfMessage,
      this.userNumber,
      this.id});
  @override
  _SingleUserState createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Color.fromRGBO(60, 65, 78, 100),
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {
          print('start chat');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => new Chat(
                    image: widget.image,
                    name: widget.name,
                    userNumber: widget.userNumber,
                    id: widget.id,
                  )));
        },
        child: ListTile(
          title: Text(
            '${widget.name}',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '${widget.lastMessage}',
            style: TextStyle(color: Colors.white),
          ),
          leading: CircleAvatar(
              radius: 30, backgroundImage: AssetImage('${widget.image}')),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${widget.date}",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '${widget.numberOfMessage}',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
