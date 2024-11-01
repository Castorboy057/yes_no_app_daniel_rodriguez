import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/widgtes/chat/her_message_bubble.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/widgtes/chat/my_message_bubble.dart';
import 'package:yes_no_app_daniel_rodriguez/presentacion/screen/chat/widgtes/shared/message_fiel_box.dart';

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
        title: const Text("Megan Bb"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder
            (itemCount:100,
            itemBuilder: (context, index) {

              return (index % 2 == 0 )
              ?const HerMessageBubble()
              :const MyMessageBubble();
              
            },)),
          

          //caja de texto
        
          const MessageFieldBox(),
          
          ],
        ),
      ),
    );
  }
}
