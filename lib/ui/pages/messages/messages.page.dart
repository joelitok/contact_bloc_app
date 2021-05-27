import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/contact.info.widgets.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/circular.progress.ind.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MessagesPage extends StatelessWidget {
  Contact contact;
  @override
  Widget build(BuildContext context) {
    this.contact=ModalRoute.of(context).settings.arguments;
    context.read<MessageBloc>().add(MessageByContactEvent(this.contact));
    return Scaffold(
appBar: AppBar(
  title: Text('Messages de ${contact.name}'),
actions: [
  BlocBuilder<MessageBloc,MessagesState>(
    builder:(context,state){
      return CircleAvatar(child:  Text('${state.messages.length}'),);
    } ,
  
  ),

  BlocBuilder<MessageBloc,MessagesState>(
    builder:(context,state){
      if(state.selectedMessages.length>0){
      return IconButton(icon: Icon(Icons.restore_from_trash), onPressed: (){
      context.read<MessageBloc>().add(new DeleteMessageEvent());
    });
    }else {
      return Container();
    }
    } ,
  
  )
],



),
body: Column(
  children: [
 ContactInfoWidget(contact),

Expanded(
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
),

MessagesFormWidget(contact)


 ],)
    );
  }
}