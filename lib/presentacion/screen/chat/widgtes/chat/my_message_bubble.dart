import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  final bool isSeen; // Indicador de si el mensaje fue visto

  const MyMessageBubble({
    super.key,
    required this.message,
    this.isSeen = false, // Por defecto no visto
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final timeFormat = DateFormat('HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timeFormat.format(message.timeStamp),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.done_all, // Doble palomita
              color: isSeen ? Colors.blue : Colors.blue, // Azul si está visto, gris si no
              size: 16,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
