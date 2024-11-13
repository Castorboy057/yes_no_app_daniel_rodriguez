import 'package:dio/dio.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';
import 'package:yes_no_app_daniel_rodriguez/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  // Se crea una instancia de la clase Dio para manejar las peticiones HTTP
  final _dio = Dio();

  // Método para obtener la respuesta
  Future<Message> getAnswer() async {
    // Realizar la petición GET y almacenar la respuesta en una variable
    final response = await _dio.get("https://yesno.wtf/api");

    // Almacenar los datos de la respuesta en una instancia de YesNoModel
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    // Devolver la instancia de Message creada a partir del modelo
    return yesNoModel.toMessageEntity();
  }
}
