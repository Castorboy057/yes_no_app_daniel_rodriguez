import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola Ader", fromWho: FromWho.me),
    Message(text: "¿Lloras porque reprobaste tópicos?", fromWho: FromWho.me),
  ];

  // Controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  // Enviar mensaje
  Future<void> sendMessage(String text) async {
    if(text.trim().isEmpty) return;
    // El mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // Agrega un elemento a la lista
    messageList.add(newMessage);
    print('cantidad de mensajes: ${messageList.length}');
    // Notifica si algo del provider cambió para que se guarde el estado
    notifyListeners();
    // Mueve el scroll
    await moveScrollToBottom();
  }

  // Mover el scroll al último mensaje
  Future<void> moveScrollToBottom() async {
    // Verifica si el controlador tiene clientes antes de intentar desplazar el scroll
    if (chatScrollController.hasClients) {
      // Un atraso en la animación para garantizar que siempre se vea, aun cuando se envíen mensajes cortos y largos
      await Future.delayed(const Duration(milliseconds: 100));
      chatScrollController.animateTo(
        // offset: posición de la animación
        // maxScrollExtent: determina a lo máximo que el scroll puede llegar
        chatScrollController.position.maxScrollExtent,
        // Duración de la animación
        duration: const Duration(milliseconds: 300),
        // Rebote al final de la animación
        curve: Curves.easeInOut,
      );
    }
  }
}
