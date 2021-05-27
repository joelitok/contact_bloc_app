import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/model/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesFormWidget extends StatelessWidget {

TextEditingController textEditingController = new TextEditingController();
Contact contact;
MessagesFormWidget(this.contact);
  @override
  Widget build(BuildContext context) {
    return Container(
  padding: EdgeInsets.all(10),
  alignment: Alignment.bottomLeft,
  child: Row(
    children: [
      Expanded(
        child: TextFormField(
          controller: textEditingController,
          maxLines: null,
          keyboardType: TextInputType.multiline,

          decoration: InputDecoration(
            hintText: "Your messages please",
            border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20)))),
        ) 
      
      )
      ,
      IconButton(icon: Icon(Icons.send), onPressed: (){

 Message message = Message(type: 'sent', contactID: contact.id,content: textEditingController.text,selected: false);
context.read<MessageBloc>().add(new AddNewMessageEvent(message));

Message replay = Message(type: 'received',  contactID: contact.id,content: 'replay to '+textEditingController.text,selected: false);
context.read<MessageBloc>().add(new AddNewMessageEvent(replay));
textEditingController.text="";
      })
    ],
  )

);
  }
}