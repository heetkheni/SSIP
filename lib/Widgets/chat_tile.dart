import 'package:arogya_mitra/screens/message_screen.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {
  final String user_id;
  final String hc_id;
  final String hc_name;
  final String lastmsg;
  ChatTile({
    super.key,
    required this.user_id,
    required this.hc_id,
    required this.hc_name,
    required this.lastmsg,
  });

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MessageScreen(userId: widget.user_id, adminId: widget.hc_id, admin_name: widget.hc_name,)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: ListTile(
          title: Text(
            widget.hc_name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.lastmsg,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              widget.hc_name.substring(0, 1).toUpperCase(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
