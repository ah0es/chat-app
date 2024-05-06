import 'package:chat_app/constant.dart';
import 'package:chat_app/cubits/chat/chat_cubit.dart';
import 'package:chat_app/widget/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/message_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  List<Messages> messagesList = [];
  final TextEditingController controller = TextEditingController();
  static String id = 'ChatPage';
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 60,
            ),
            const Text('chat'),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/tw0nawnvo0zpgm5nx4fp.webp',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: BlocConsumer<ChatCubit, ChatState>(
                  listener: (context, state) {
                    if (state is ChatSuccess) {
                      messagesList = state.messages;
                    }
                  },
                  builder: (context, state) {
                    return ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBuble(
                                  message: messagesList[index],
                                )
                              : ChatBubleFromFriend(
                                  message: messagesList[index]);
                        });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 80,
                    width: 360,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, bottom: 10, top: 10),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          BlocProvider.of<ChatCubit>(context)
                              .sendMessage(message: data, email: email);

                          controller.clear();
                          _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Send Massage...',
                          // suffixIcon: const Icon(
                          //   Icons.send,
                          //   color: kPrimaryColor,
                          // ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff01887A),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
