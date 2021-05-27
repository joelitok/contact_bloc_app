import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/model/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageItemWidget extends StatelessWidget {
  Message message;
  MessageItemWidget(this.message);
  @override
  Widget build(BuildContext context) {
    return   ListTile(
  selected: message.selected,selectedTileColor: Colors.black12,
  onLongPress: (){

    context.read<MessageBloc>().add(new SelectMessageEvent(message));
  },
      title: Row(
        mainAxisAlignment: (message.type=='received')?MainAxisAlignment.start:MainAxisAlignment.end,
        children: [
          (message.type=='received') ? SizedBox(width: 0,):SizedBox(width: 40,),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(20),
            color: (message.type=='received') ? Color.fromARGB(20,255,255,255):Color.fromARGB(20,0,255,0),  
            child: Text('${message.content}  (${message.date.day}/${message.date.month}/${message.date.year}, ${message.date.hour} : ${message.date.minute} )'),
            foregroundDecoration: BoxDecoration(border: Border.all(
            color: Colors.green)),
            ),
          ),
(message.type=='received') ? SizedBox(width: 40,):SizedBox(width: 0,)
        ],
      ),
  
    );
  }
}