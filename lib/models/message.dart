import 'package:chat_app/constants.dart';

class message {
  final String messageBody;
  final String id;
  message(this.messageBody, this.id);
  factory message.fromjson(jsonData) {
    return message(jsonData[kmessage], jsonData['id']);
  }
}
