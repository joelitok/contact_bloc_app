import 'dart:math';

import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/model/message.model.dart';
import 'package:flutter/material.dart';

class MessagesRepository{
  int messageCount;
  Map<int,Message> messages={
 1:Message(id: 1,contactID: 1,date: DateTime.now(),content: 'hi every one fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsdfsdfsdf',type: 'sent',selected: false),
 2:Message(id: 2,contactID: 1,date: DateTime.now(),content: "OK thank's dffsdfffffffffffffffffffffsdfsdfsfsfsdfsdfsdfss", type: 'received',selected: false),
 3:Message(id: 3,contactID: 1,date: DateTime.now(),content: 'what are doing',type: 'sent',selected: false),
 4:Message(id: 4,contactID: 1,date: DateTime.now(),content: 'No thing',type: 'received',selected: false),
 5:Message(id: 5,contactID: 2,date: DateTime.now(),content: 'Hi joel',type: 'sent',selected: false),
 6:Message(id: 6,contactID: 2,date: DateTime.now(),content: 'Well received',type: 'sent',selected: false),

  };


MessagesRepository(){
  this.messageCount=messages.length;
}
Future<List<Message>> allmessages() async{
var future = await Future.delayed(Duration(seconds: 1));
int rnd = new Random().nextInt(10);
if(rnd>1){
  return messages.values.toList();
}else {
  throw new Exception('Internet Error');
}

}


Future<List<Message>> messageByContact(int contactID) async{
var future = await Future.delayed(Duration(seconds: 1));
int rnd = new Random().nextInt(6);
if(rnd>1){
  return messages.values.toList().where((element) => element.contactID==contactID).toList();
}else {
  throw new Exception('Internet Error');
}

}




Future<Message> AddNewMessage(Message message) async{

var future = await Future.delayed(Duration(seconds: 1));
int rnd = new Random().nextInt(6);
if(rnd>1){
  message.id=++messageCount;
  messages[message.id]=message;
  return message;
 }else {
  throw new Exception('Internet Error');
}

}




Future<void> deleteMessage(Message message) async{

var future = await Future.delayed(Duration(seconds: 1));
int rnd = new Random().nextInt(6);
if(rnd>1){
  messages.remove(message.id);
 }else {
  throw new Exception('Internet Error');
}

}






}