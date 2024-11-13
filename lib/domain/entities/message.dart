//identidad atomica: lo mas pequeño
enum FromWho{me, hers}
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timeStamp;


// Recibe la fecha y hora en que se creó el mensaje y la asigna a 'timeStamp'
  Message(this.timeStamp, {required this.text, this.imageUrl, required this.fromWho});
}