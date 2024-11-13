// yes_no_model.dart
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // Método factory para crear una instancia desde JSON
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"] as String,
        forced: json["forced"] as bool,
        image: json["image"] as String,
      );

  // Método estático fromJsonMap
  static YesNoModel fromJsonMap(Map<String, dynamic> data) {
    // Verificamos que los campos necesarios estén en la data
    if (data["answer"] == null || data["image"] == null) {
      throw Exception("Datos faltantes en la respuesta JSON");
    }
    return YesNoModel.fromJson(data);
  }

  // Convertir YesNoModel a una entidad Message
  Message toMessageEntity() => Message(
        text: answer == 'yes'
            ? 'Sí'
            : answer == 'no'
                ? 'No'
                : "Quizás",
        fromWho: FromWho.hers,
        imageUrl: image,
        DateTime.timestamp()
      );

  @override
  String toString() {
    return 'YesNoModel(answer: $answer, forced: $forced, image: $image)';
  }
}
