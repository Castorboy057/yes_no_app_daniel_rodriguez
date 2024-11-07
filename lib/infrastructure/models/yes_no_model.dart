//El modelo define que datos debe 
//tener la aplicacion. investigar MVC: Modelo = datos 
//vista: Pantalla, Controlador: logica
class YesNoModel {
  //Atributos
 final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}
