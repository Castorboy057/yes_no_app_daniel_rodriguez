import 'package:dio/dio.dart';
import 'package:yes_no_app_daniel_rodriguez/domain/entities/message.dart';


class GetYesNoAnswer {

  //Se cre instacia de la clase Dio
  //para manejar las peticiones HTTP
  final _dio = Dio();
  //Para obtener la respuesta 
  Future<Message> getAnswer() async {
final response = await _dio.get("https:///yesno.wtf/api");

//Gen
throw UnimplementedError();
  }
}