import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<message> messagesList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  void sendMessage({required String data, required String email}) {
    messages.add({kmessage: data, kCreatedAt: DateTime.now(), 'id': email});
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(message.fromjson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
