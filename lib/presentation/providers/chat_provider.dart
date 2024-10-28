import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{
  List<Message> messageList =[
    Message(text: "Hola Ader", fromWho: FromWho.me),
    Message(text: "LLoras por que reprobaste topicos?", fromWho: FromWho.me)
  ];
//Controlador para manejar la posicion del scroll
final ScrollController chatScrollController = ScrollController();

//Enviar mensaje
Future<void> sendMessage(String text) async {
  //El mensaje 
  final newMessage = Message(text: text, fromWho: FromWho.me);
  //Agrega un elemento a la lista
  messageList.add(newMessage);
  //Notifica si algo del provider cambio para que se guarde el estado
notifyListeners();
//Mueve el scroll
moveScrollToBottom();
}

  //Mover el scroll al ultimo mensaje
  Future<void> moveScrollToBottom() async{
    //Un atraso en la animacion para garantizar que siempre 
    //se vera aun cuando se envien mensajes cortos y largoa 
    await Future.delayed(const  Duration(seconds: 1));
    chatScrollController.animateTo(
      //offset: posicion de la animacion
      //MaxScrollExtent: determina a lo maximo que el scroll puede dar
      chatScrollController.position.maxScrollExtent,
      //Duracion de la animacion
       duration: const Duration(milliseconds: 300)
       //Rebote al final de la animacion
       , curve: Curves.easeInOut);
  }
  
}
