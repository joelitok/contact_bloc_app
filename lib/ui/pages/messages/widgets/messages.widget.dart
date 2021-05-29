import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/circular.progress.ind.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
  child:   BlocBuilder<MessageBloc, MessagesState>(
  
    builder: (context,state){
  
      if(state.requestState==RequestState.LOADING){
  
        return MyCircularProgressIndWidget();
  
      }else if(state.requestState==RequestState.ERROR){
  
        return ErrorRetryMessage(errorMessage: state.messageError, onAction: (){
  
  context.read<MessageBloc>().add(state.currentMessageEvent);
  
        },);
  
      }else if (state.requestState==RequestState.LOADED){
  
  return  MessagesListWidget(state.messages);
  

  
   
  
 }else{
  
        return Container();
  
      }
  
  
  
    },
  
    
  
  ),
);

  }
}