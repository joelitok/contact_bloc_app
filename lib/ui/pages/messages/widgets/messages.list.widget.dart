import 'package:contacts_blog_app/model/message.model.dart';
import 'package:flutter/material.dart';

import 'message.item.widget.dart';

class MessagesListWidget extends StatelessWidget {

  List<Message> messages;
  ScrollController scrollController= new ScrollController();
  MessagesListWidget(this.messages);
  @override
  Widget build(BuildContext context) {

WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
if(scrollController.hasClients)  
scrollController.jumpTo(scrollController.position.maxScrollExtent);  
});

    return    ListView.separated(
  controller: scrollController,
    itemBuilder: (context, index)=> 
    MessageItemWidget(messages[index]),

   separatorBuilder: (context,index)=>Divider(color: Colors.deepOrange,height: 2,),
   itemCount: messages.length);
  }
}