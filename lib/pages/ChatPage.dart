// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:chat_app/Cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/ChatBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  String? data;
  TextEditingController controller = TextEditingController();
  final Scrollcontrol = ScrollController();

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(kLogo, height: 50),
            const Text('Scholar chat'),
          ],
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  List<message> messagesList =
                      BlocProvider.of<ChatCubit>(context).messagesList;
                  return ListView.builder(
                    reverse: true,
                    controller: Scrollcontrol,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBubble(
                              Amessage: messagesList[index],
                            )
                          : AnotherChatBubble(Amessage: messagesList[index]);
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 10,
              textInputAction: TextInputAction.newline,
              controller: controller,
              onChanged: (value) {
                data = value;
              },
              decoration: InputDecoration(
                hintText: 'Send a message',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    if (data != null) {
                      BlocProvider.of<ChatCubit>(context)
                          .sendMessage(data: data!, email: email);
                      controller.clear();
                      ScrollToTheTop();
                      data = null;
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void ScrollToTheTop() {
    Timer(const Duration(milliseconds: 300), () {
      Scrollcontrol.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    });
  }
}
