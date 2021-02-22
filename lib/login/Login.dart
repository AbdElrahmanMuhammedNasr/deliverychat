import 'package:flutter/material.dart';
import 'package:flutter_main_app/chats/chats.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  _saveUserData(String phone , String name)async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("phone", phone);
      prefs.setString('name', name);
      // after save data navigate
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new Chats()));

  }

  _ifUserLogin () async  {
      SharedPreferences prefs = await SharedPreferences.getInstance();
       if(prefs.getString('phone') != null){
         print(prefs.getString('phone'));
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new Chats()));
       }else{
         print('this is phone '+prefs.getString('phone'));

       }
  }

  String _phone ;
  String _name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    _ifUserLogin();
   

    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "  Phone",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.phone_android),
                            ),
                            onSaved: (val) {
                              _phone = val;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.white   ,
                            borderRadius: BorderRadius.circular(1),
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "  Name",
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.account_circle),
                            ),
                            onSaved: (val) {
                              _name = val;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.black.withOpacity(0.6),
                child: FlatButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    _saveUserData(_phone,_name);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
