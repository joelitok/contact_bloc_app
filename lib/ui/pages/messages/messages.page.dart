import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
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
appBar: AppBar(title: Text('Messages'),),
body: Column(
  children: [
  Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
      CircleAvatar(child: Text('${contact.profile}'),),
      SizedBox(width: 10,),
      Text('${contact.name}')
    ],),
  ),
Expanded(
  child:   BlocBuilder<MessageBloc, MessagesState>(
  
    builder: (context,state){
  
      if(state.requestState==RequestState.LOADING){
  
        return Center(child: CircularProgressIndicator(),);
  
      }else if(state.requestState==RequestState.ERROR){
  
        return ErrorRetryMessage(errorMessage: state.messageError, onAction: (){
  
  context.read<MessageBloc>().add(state.currentMessageEvent);
  
        },);
  
      }else if (state.requestState==RequestState.LOADED){
  
  return 
  
   ListView.separated(
  
    itemBuilder: (context, index)=>ListTile(
  
      title: Row(
  
        children: [
  
          Text('${state.messages[index].content}')
  
        ],
  
      ),
  
    ), 
   separatorBuilder: (context,index)=>Divider(color: Colors.deepOrange,height: 2,),
   itemCount: state.messages.length);
  
   
  
 }else{
  
        return Container();
  
      }
  
  
  
    },
  
    
  
  ),
),

Container(
  padding: EdgeInsets.all(10),
  alignment: Alignment.bottomLeft,
  child: Text('Message form'),

)


 ],)
    );
  }
}