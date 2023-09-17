import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({required this.Amessage});
  final message Amessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          Amessage.messageBody,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
      ),
    );
  }
}

class AnotherChatBubble extends StatelessWidget {
  AnotherChatBubble({required this.Amessage});
  final message Amessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          Amessage.messageBody,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Color(0xff006F94),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
      ),
    );
  }
}
