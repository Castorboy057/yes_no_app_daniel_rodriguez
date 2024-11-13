import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  final bool isRead; // Variable que indica si el mensaje fue leído

  const HerMessageBubble({
    super.key,
    required this.message,
    this.isRead = false, // Por defecto, el mensaje no ha sido leído
  });
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final timeFormat = DateFormat('HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorScheme.secondary,
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
        if (message.imageUrl != null) _ImageBubble(imageUrl: message.imageUrl!),
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
              Icons.done_all,
              color: isRead ? Colors.blue : Colors.blue, // Azul si el mensaje fue leído, gris si no
              size: 16,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
