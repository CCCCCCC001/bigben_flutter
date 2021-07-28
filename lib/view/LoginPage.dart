import 'package:bigben/view/HomePage.dart';
import 'package:flutter/material.dart';

import 'ClockPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登录页"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //账号输入框
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_box_outlined),
                            hintText: "请输入账号",
                          ),
                        ),
                        Divider(height: 20,),
                        //密码输入框
                        TextField(decoration: InputDecoration(
                          icon: Icon(Icons.lock_outline),
                          hintText: "请输入密码",
                        ),),
                        Divider(height: 20,),
                        //登录按钮
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return HomePage();
                              }));
                            }, child: Text("登录")),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
