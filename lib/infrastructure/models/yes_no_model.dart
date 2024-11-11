
// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);


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

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );


Message toMessageEntity() => Message(
  text: answer == 'yes'
  ?'Sí'
  : answer =='no' ? 'No'
  :"Quizas",

   fromWho: FromWho.hers,
   imageUrl: image);

  static fromJsonMap(data) {}

}

