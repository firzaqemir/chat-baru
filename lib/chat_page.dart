import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/chat_detail_page.dart';

class ChatUsers {
  String text;
  String time;

  ChatUsers(
      {@required this.text,
      @required this.time});
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(text: "Guest", time: "Now"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Chats"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ChatUsersList(
              text: chatUsers[index].text,
//              secondaryText: chatUsers[index].secondaryText,
              time: chatUsers[index].time,
              isMessageRead: (index == 0 || index == 3) ? true : false,
            );
          },
        ),
      ],
    ),
    )
//      body: SingleChildScrollView(
//        physics: BouncingScrollPhysics(),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            SafeArea(
//              child: Padding(
//                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text(
//                      "Chats",
//                      style:
//                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                    ),
//                    Container(
//                      padding:
//                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
//                      height: 30,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(30),
//                        color: Colors.pink[50],
//                      ),
//                      child: Row(
//                        children: <Widget>[
//                          Icon(
//                            Icons.add,
//                            color: Colors.pink,
//                            size: 20,
//                          ),
//                          SizedBox(
//                            width: 2,
//                          ),
//                          Text(
//                            "New",
//                            style: TextStyle(
//                                fontSize: 14, fontWeight: FontWeight.bold),
//                          ),
//                        ],
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
//              child: TextField(
//                decoration: InputDecoration(
//                  hintText: "Search...",
//                  hintStyle: TextStyle(color: Colors.grey.shade400),
//                  prefixIcon: Icon(
//                    Icons.search,
//                    color: Colors.grey.shade400,
//                    size: 20,
//                  ),
//                  filled: true,
//                  fillColor: Colors.grey.shade100,
//                  contentPadding: EdgeInsets.all(8),
//                  enabledBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(30),
//                      borderSide: BorderSide(color: Colors.grey.shade100)),
//                ),
//              ),
//            ),
        );
  }
}

class ChatUsersList extends StatefulWidget {
  String text;
  String time;
  bool isMessageRead;

  ChatUsersList(
      {@required this.text,
      @required this.time,
      @required this.isMessageRead});

  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text),
                          SizedBox(
                            height: 6,
                          ),
//                          Text(
//                            widget.secondaryText,
//                            style: TextStyle(
//                                fontSize: 14, color: Colors.grey.shade500),
//                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  color: widget.isMessageRead
                      ? Colors.pink
                      : Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
