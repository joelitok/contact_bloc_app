import 'dart:math';

import 'package:contacts_blog_app/model/message.model.dart';

class MessagesRepository{
  Map<int,Message> messages={
 1:Message(id: 1,contactID: 1,date: DateTime.now(),content: 'hi every one',type: 'sent'),
 2:Message(id: 2,contactID: 1,date: DateTime.now(),content: "OK thank's", type: 'received'),
 3:Message(id: 3,contactID: 1,date: DateTime.now(),content: 'what are doing',type: 'sent'),
 4:Message(id: 4,contactID: 1,date: DateTime.now(),content: 'No thing',type: 'received'),
 5:Message(id: 5,contactID: 2,date: DateTime.now(),content: 'Hi joel',type: 'sent'),
 6:Message(id: 6,contactID: 2,date: DateTime.now(),content: 'Well received',type: 'sent'),

  };

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






}