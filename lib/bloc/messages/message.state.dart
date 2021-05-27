import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/message.model.dart';

class MessagesState {
  RequestState requestState;
  List<Message> messages;
  String messageError;
  MessageEvent currentMessageEvent;
  List<Message> selectedMessages=[];


  MessagesState({
  this.requestState,
  this.messages,
  this.messageError,
  this.currentMessageEvent,
  this.selectedMessages});

MessagesState.initialState():
requestState = RequestState.NONE,
messages=[], messageError='',currentMessageEvent=null,
selectedMessages=[];

}