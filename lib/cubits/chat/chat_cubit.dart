import 'package:bloc/bloc.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../constant.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);

  void sendMessage({required String message, required String email}) {
    messages.add({
      'message': message,
      'createsAt': DateTime.now(),
      'id': email,
    });
  }

  void getMesssage() {
    messages.orderBy('createsAt', descending: true).snapshots().listen(
      (event) {
        List<Messages> messageList = [];

        for (var docs in event.docs) {
          messageList.add(Messages.fromJson(docs));
        }

        emit(ChatSuccess(messages: messageList));
      },
    );
  }
}
