import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyAppBarWidget extends AppBar {
 Contact contact; 
MyAppBarWidget(Contact contact):super(
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

);
}