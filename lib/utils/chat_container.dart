import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  final String text;
  final int chatNum;

  ChatContainer({required this.text, required this.chatNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 5),
      alignment: chatNum == 2 ? Alignment.centerLeft : Alignment.centerRight,

      decoration: BoxDecoration(
          color: chatNum == 2 ? Colors.cyanAccent.withOpacity(0.3) : Color(0xfffefae0),
          borderRadius: chatNum == 2
              ? BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )),
      child: Text(text),
    );
  }
}