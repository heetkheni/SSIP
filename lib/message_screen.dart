import 'package:arogya_mitra/services/db_services.dart';
import 'package:arogya_mitra/widgets/message_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  String userId, adminId, admin_name;
  MessageScreen(
      {super.key,
      required this.userId,
      required this.adminId,
      required this.admin_name});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String who = FirebaseAuth.instance.currentUser!.uid;
  String? conversationId;
  Stream? chats;
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMsg();
  }

  getMsg() async {
    await DatabaseServices()
        .getConversationId(widget.userId, widget.adminId)
        .then((value) {
      setState(() {
        conversationId = value;
        print(conversationId);
      });
    });
    await DatabaseServices().getChatMessages(conversationId).then((value) {
      setState(() {
        chats = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.admin_name),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info))],
      ),
      body: Column(
        children: [
          Expanded(child: chatMessages()),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[700],
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: messageController,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                        hintText: 'Send your message...',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        border: InputBorder.none),
                    cursorColor: Colors.white,
                  )),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      sendChatMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.send,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      message: snapshot.data.docs[index]['message'].toString(),
                      sendByMe: who ==
                          snapshot.data.docs[index]['sender_id'].toString());
                },
              )
            : Container();
      },
    );
  }

  sendChatMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        'message': messageController.text,
        'sender_id': who == widget.userId ? widget.userId : widget.adminId,
        'time': DateTime.now().millisecondsSinceEpoch.toString()
      };

      if (conversationId == null) {
        DatabaseServices()
            .sendFirstmsg(widget.userId, widget.adminId, chatMessageMap)
            .then((value) {
          setState(() {
            conversationId = value;
            messageController.clear();
          });
        });
      } else {
        DatabaseServices().sendChatMessage(conversationId, chatMessageMap);
        setState(() {
          messageController.clear();
        });
      }
    }
  }
}
