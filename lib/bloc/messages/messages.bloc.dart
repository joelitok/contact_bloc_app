import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';

import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/message.model.dart';
import 'package:contacts_blog_app/repositories/message.repository.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class MessageBloc extends Bloc<MessageEvent,MessagesState>{
  MessagesRepository messagesRepository;
  MessageBloc({ @required MessagesState initialState,@required this.messagesRepository}) : super(initialState);


  @override
  Stream<MessagesState> mapEventToState(MessageEvent event)  async*{
if(event is MessageByContactEvent){

yield MessagesState(requestState : RequestState.LOADING,messages: state.messages,currentMessageEvent: event);

try{
List<Message> data = await messagesRepository.messageByContact(event.payload.id);
yield MessagesState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event);
} catch (e){
  yield MessagesState(requestState: RequestState.ERROR,messageError: e.toString(),messages: state.messages,currentMessageEvent: event);
}


  
}




  }

}

