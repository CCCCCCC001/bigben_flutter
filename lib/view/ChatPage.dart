import 'dart:async';

import 'package:bigben/base/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharPage extends StatefulWidget {
  CharPage({Key? key}) : super(key: key);

  @override
  _CharPageState createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {

  //ListView控制器
  ScrollController _controller = new ScrollController();

  List<Message> messageList = [
    Message(content: "你好,Tom.", dateTime: DateTime.now(), user: "Sam"),
    Message(content: "你好.", dateTime: DateTime.now(), user: "Tom"),
    Message(
        content:
            "你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.",
        dateTime: DateTime.now(),
        user: "Sam"),
    Message(content: "你好.", dateTime: DateTime.now(), user: "Tom"),
    Message(content: "你好,Tom.", dateTime: DateTime.now(), user: "Sam"),
    Message(content: "你好.", dateTime: DateTime.now(), user: "Tom"),
    Message(content: "你好,Tom.", dateTime: DateTime.now(), user: "Sam"),
    Message(content: "你好.", dateTime: DateTime.now(), user: "Tom"),
    Message(
        content:
            "你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.你好,Tom.",
        dateTime: DateTime.now(),
        user: "Sam"),
    Message(content: "你好.", dateTime: DateTime.now(), user: "Tom"),
    Message(content: "你好,Tom.", dateTime: DateTime.now(), user: "Sam"),
    Message(content: "你好.", dateTime: DateTime.now(), user: "Tom"),
  ];

  @override
  Widget build(BuildContext context) {
    if (messageList.length > 0)
      Timer(Duration(milliseconds: 500),
              () => _controller.jumpTo(_controller.position.maxScrollExtent));
    return Scaffold(
        appBar: AppBar(
          title: Text("时钟页面"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                    controller: _controller,
                itemCount: messageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return chatListItem(index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 4,
                  );
                },
              )),
              Divider(color: Colors.grey,),
              //底部文本框
              Row(
                children: [
                  Expanded(
                    //输入框
                    child: TextField(
                      maxLines: null,
                    ),
                  ),
                  SizedBox(width: 5,),
                  //发送按钮
                  ElevatedButton(onPressed: () {}, child: Icon(Icons.send))
                ],
              )
            ],
          ),
        ));
  }

  //ListView的Item
  Widget chatListItem(int index) {
    return Container(
      child: messageList[index].user == "Tom"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                bubble(messageList[index].content, true),
                Icon(Icons.person),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person),
                bubble(messageList[index].content, false),
              ],
            ),
    );
  }

  //气泡组件 user：是否是发送者
  Widget bubble(String content, bool user) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 2,
      decoration: user
          ? BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)))
          : BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
      child: Text(content),
    );
  }
}
