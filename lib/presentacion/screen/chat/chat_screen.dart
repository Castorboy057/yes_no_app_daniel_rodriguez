import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/widgtes/chat/her_message_bubble.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/widgtes/chat/my_message_bubble.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/widgtes/shared/message_fiel_box.dart';
import 'package:yes_no_app_daniel_rodriguez/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://files.idyllic.app/files/static/957752?width=256&optimizer=image"),
          ),
        ),
        title: const Text("Megan Bb😍"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder
            (itemCount: chatProvider.messageList.length,
            controller: chatProvider.chatScrollController,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];
              return (message.fromWho ==  FromWho.hers)
              ?HerMessageBubble(message: message,)
              :MyMessageBubble(message: message,);
              
            },)),
          

          //caja de texto
        
          MessageFieldBox(
            onValue: chatProvider.sendMessage,
          ),
          
          ],
        ),
      ),
    );
  }
}
