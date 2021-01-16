import 'package:flutter/material.dart';
import 'package:flutter_main_app/login/Login.dart';
import 'package:flutter_svg/svg.dart';

class Welome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "images/logo.svg",
            height: 300,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Welcome To Delivery',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => new Login()));
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            ),
            label: Text(""),
          )
        ],
      ),
    );
  }
}
