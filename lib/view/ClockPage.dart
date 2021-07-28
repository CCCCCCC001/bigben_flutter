import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  ClockPage({Key? key}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  //标题数组
  List titleList = ["单词背诵1", "单词背诵1", "单词背诵1","单词背诵1","单词背诵1", "单词背诵1", "单词背诵1", "单词背诵2"];

  //具体描述数组
  List subtitleList = ["单词背诵1","单词背诵1","单词背诵1","单词背诵1","单词背诵1","单词背诵1","单词背诵1", "单词背诵2"];

  //是check数组
  List<bool> checkList = [false, true, true, true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("今日学习时间: 15 小时 6 分"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //时钟卡片
              Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //时
                            ElevatedButton(
                              child: Text("20"),
                              style: ButtonStyle(
                                //阴影
                                elevation: MaterialStateProperty.all(0),
                                //背景色
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                //字体颜色
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                //字体大小
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 60)),
                              ),
                              onPressed: () {
                                print('我被点击了');
                              },
                            ),
                            Text(
                              ":",
                              style: TextStyle(fontSize: 60),
                            ),
                            //分
                            ElevatedButton(
                              child: Text("20"),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 60)),
                              ),
                              onPressed: () {
                                print('我被点击了');
                              },
                            ),
                            //秒
                            ElevatedButton(
                              child: Text("20"),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 20)),
                              ),
                              onPressed: () {
                                print('我被点击了');
                              },
                            ),
                          ],
                        ),
                        //模式选择
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.lightBlue),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 20)),
                              ),
                              onPressed: () {},
                              child: Text("倒计时"),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(20),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.lightBlue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 20)),
                                ),
                                onPressed: () {},
                                child: Text("时钟")),
                            ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(20),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.lightBlue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 20)),
                                ),
                                onPressed: () {},
                                child: Text("正计时")),
                          ],
                        ),
                        //操作
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //停止按钮
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.lightBlue),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 20)),
                              ),
                              onPressed: () {},
                              child: Text("停止"),
                            ),
                            //暂停按钮
                            ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(20),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.lightBlue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 20)),
                                ),
                                onPressed: () {},
                                child: Text("暂停")),
                          ],
                        ),
                      ],
                    ),
                  )),
              Divider(height:10),
              //今日任务
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text("今日任务",style: TextStyle(fontSize: 20),),
                OutlinedButton(onPressed: (){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('添加任务'),
                          content: Column(children: [
                            TextField(),
                            TextField(),
                          ],),
                          actions: <Widget>[
                            ElevatedButton(onPressed: (){}, child: Text("取消")),
                            ElevatedButton(onPressed: (){}, child: Text("确定")),
                          ],
                        );
                      });
                }, child: Text("添加"),)
              ],),
              //下方任务列表
              Expanded(child: Container(child: ListView.separated(
                separatorBuilder: (BuildContext context,int index){
                  return Divider(height: 1,);
                },
                  itemCount: titleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return taskListItem(index);
                  }))),
            ],
          ),
        ));
  }

  Widget taskListItem(int index) {
    return CheckboxListTile(
      secondary: Icon(Icons.wallet_travel_outlined),
      title: Text(titleList[index]),
      subtitle: Text(subtitleList[index]),
      onChanged: (bool? value) {
        setState(() {
          checkList[index] = !checkList[index];
        });
      },
      value: checkList[index],
    );
  }
}
