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

yield MessagesState(requestState : RequestState.LOADING,messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages);

try{
List<Message> data = await messagesRepository.messageByContact(event.payload.id);
yield MessagesState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event,selectedMessages: state.selectedMessages);
} catch (e){
  yield MessagesState(requestState: RequestState.ERROR,messageError: e.toString(),messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages);
}


  
} else if(event is AddNewMessageEvent){

//yield MessagesState(requestState : RequestState.LOADING,messages: state.messages,currentMessageEvent: event);

try{
event.payload.date = DateTime.now();
Message message = await messagesRepository.AddNewMessage(event.payload);
List<Message> data = [...state.messages];
data.add(message);
yield MessagesState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event,selectedMessages: state.selectedMessages);
} catch (e){
yield MessagesState(requestState: RequestState.ERROR,messageError: e.toString(),messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages);
}


  
}else if(event is SelectMessageEvent){
List<Message> messages = state.messages;
List<Message> selected = [...state.selectedMessages];
for(Message m in messages){
  if(m.id==event.payload.id){
    m.selected=!m.selected;
  }
  if(m.selected==true){
    selected.add(m);
  }else{
    selected.removeWhere((element) => element.id==m.id);
  }
} 
  
  MessagesState messagesState =MessagesState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.LOADED);
yield messagesState;

}else if(event is DeleteMessageEvent){
List<Message> messages = state.messages;
List<Message> selected = [...state.selectedMessages];
for(Message m in selected){

  try {
    await messagesRepository.deleteMessage(m);
    messages.removeWhere((element) => element.id==m.id);
     MessagesState messagesState =MessagesState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.LOADED);
    yield messagesState;
  } catch (e) {
    MessagesState messagesState =MessagesState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.ERROR);
    yield messagesState;
  }
} 
  
   
}














  }

}

