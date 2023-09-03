import 'package:yes_no_flutter/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool force;
  String image;

  YesNoModel({
    required this.answer,
    required this.force,
    required this.image,
  });

  factory YesNoModel.fromJsonMap( Map<String, dynamic> json ) =>
    YesNoModel(
      answer: json['answer'],
      force: json['forced'],
      image: json['image'],
    );

  Message toMessageEntity() => Message(
    text: answer,
    fromWho: FromWho.she,
    imageUrl: image,
  );
}
