import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//class ChatDetailPage extends StatefulWidget {
//  @override
//  _ChatDetailPageState createState() => _ChatDetailPageState();
//}
//
//class SendMenuItems{
//  String text;
//  IconData icons;
//  MaterialColor color;
//  SendMenuItems({@required this.text,@required this.icons,@required this.color});
//}
//
const String nama = "Guest";
//
//class _ChatDetailPageState extends State<ChatDetailPage> {
//
//  List<SendMenuItems> menuItems = [
//    SendMenuItems(text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
//    SendMenuItems(text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
//    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
//    SendMenuItems(text: "Location", icons: Icons.location_on, color: Colors.green),
//    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
//  ];
//
//  void showModal() {
//    showModalBottomSheet(
//        context: context,
//        builder: (context) {
//          return Container(
//            height: MediaQuery.of(context).size.height / 2,
//            color: Color(0xff737373),
//            child: Container(
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(20),
//                    topLeft: Radius.circular(20)),
//              ),
//              child: Column(
//                children: <Widget>[
//                  SizedBox(
//                    height: 15,
//                  ),
//                  Center(
//                    child: Container(
//                      height: 4,
//                      width: 50,
//                      color: Colors.grey.shade200,
//                    ),
//                  ),
////                  SizedBox(
////                    height: 10,
////                  ),
//                  ListView.builder(
//                    itemCount: menuItems.length,
//                    shrinkWrap: true,
//                    physics: NeverScrollableScrollPhysics(),
//                    itemBuilder: (context, index) {
//                      return Container(
//                        padding: EdgeInsets.only(top: 5, bottom: 5),
//                        child: ListTile(
//                          leading: Container(
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(30),
//                              color: menuItems[index].color.shade50,
//                            ),
//                            height: 50,
//                            width: 50,
//                            child: Icon(
//                              menuItems[index].icons,
//                              size: 20,
//                              color: menuItems[index].color.shade400,
//                            ),
//                          ),
//                          title: Text(menuItems[index].text),
//                        ),
//                      );
//                    },
//                  )
//                ],
//              ),
//            ),
//          );
//        });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: ChatDetailPageAppBar(),
//      body: Stack(
//        children: <Widget>[
//          ListView.builder(
//            itemCount: chatMessage.length,
//            shrinkWrap: true,
//            padding: EdgeInsets.only(top: 10, bottom: 10),
//            physics: NeverScrollableScrollPhysics(),
//            itemBuilder: (context, index) {
//              return ChatBubble(
//                chatMessage: chatMessage[index],
//              );
//            },
//          ),
//          Align(
//            alignment: Alignment.bottomLeft,
//            child: Container(
//              padding: EdgeInsets.only(left: 16, bottom: 10),
//              height: 80,
//              width: double.infinity,
//              color: Colors.white,
//              child: Row(
//                children: <Widget>[
//                  GestureDetector(
//                    onTap: () {
//                      showModal();
//                    },
//                    child: Container(
//                      height: 40,
//                      width: 40,
//                      decoration: BoxDecoration(
//                        color: Colors.blueGrey,
//                        borderRadius: BorderRadius.circular(30),
//                      ),
//                      child: Icon(
//                        Icons.add,
//                        color: Colors.white,
//                        size: 21,
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 16,
//                  ),
//                  Expanded(
//                    child: TextField(
//                      controller: _textController,
//                      decoration: InputDecoration(
//                          hintText: "Type message...",
//                          hintStyle: TextStyle(color: Colors.grey.shade500),
//                          border: InputBorder.none),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.bottomRight,
//            child: Container(
//              padding: EdgeInsets.only(right: 30, bottom: 15),
//              child: FloatingActionButton(
//                onPressed: () {},
//                child: Icon(
//                  Icons.send,
//                  color: Colors.white,
//                ),
//                backgroundColor: Colors.pink,
//                elevation: 0,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}

// bagian appbar atas
class ChatDetailPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  //appbar yg atas
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black,),
              ),
              SizedBox(width: 2,),
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                maxRadius: 20,
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Guest", style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),),
                    SizedBox(height: 6,),
//                    Text("Online",style: TextStyle(color: Colors.green,fontSize: 12),),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey.shade700,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut
        ),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(nama[0])),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(nama, style: Theme.of(context).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false; // make it true whenever the user is typing in the input field.

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

//  void dispose() {
//    for (ChatMessage message in _messages)
//      message.animationController.dispose();
//    super.dispose();
//  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                  child: new Text("Send"),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )
                    : new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )),
          ]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ChatDetailPageAppBar(),
      body: new Container(
          child: new Column(
              children: <Widget>[
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    )
                ),
                new Divider(height: 1.0),
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
              ]
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS ? new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null),//new
    );
  }
}



