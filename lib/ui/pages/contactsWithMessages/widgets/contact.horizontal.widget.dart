import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/ui/pages/contactsWithMessages/widgets/contact.list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactHorizontalItemWidget extends StatelessWidget {
  
  Contact contact;
  int index;
ScrollController scrollController;
ContactHorizontalItemWidget({this.contact,this.index,this.scrollController});


  @override
  Widget build(BuildContext context) {
    return  Padding(
     padding: const EdgeInsets.all(8.0),
     child: InkWell(
       onTap: (){
         context.read<MessageBloc>().add(new MessageByContactEvent(contact));
         scrollController.animateTo((index*200-150).toDouble(), duration:Duration(seconds: 2), curve: Curves.ease);
       },
       child: BlocBuilder<MessageBloc,MessagesState>(
         builder: (context,messagesState)=>Card(
           elevation: 1,
           child: Container(



                 padding: EdgeInsets.all(16),
                 width: 150,
                 child: Column(
                       children: [
                         CircleAvatar(child: Text('${contact.profile}'),),
                         Text('${contact.name}  ' ),
                          Text('${contact.score}'),
                         
                       ],
                 ),
                 decoration: BoxDecoration(border: Border.all(
                   
                   width:(messagesState.currentContact==contact)?3:1, color: Colors.deepOrange)),
                 
                 ),
         ),
       ),
     ),
   );
  }
}