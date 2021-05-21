import 'package:contacts_blog_app/bloc/contact.action.dart';
import 'package:contacts_blog_app/bloc/contact.bloc.dart';
import 'package:contacts_blog_app/bloc/contact.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ContactsButtonItem extends StatelessWidget {
String buttonLabel;
ContactsEvent contactsEvent;

ContactsButtonItem({this.buttonLabel,this.contactsEvent});

  @override
  Widget build(BuildContext context) {


return BlocBuilder<ContactsBloc,ContactsState>(
builder: (context,state){
return Container(
        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
        decoration: BoxDecoration(
border: Border.all(

  width: (state.currentEvent.runtimeType==contactsEvent.runtimeType)?2:0, 
  color:  Colors.deepOrange
)

        ),

        child: RaisedButton(
        onPressed: () {
        context.read<ContactsBloc>().add(contactsEvent);
                        },
        child: Text(
        buttonLabel,
        style: TextStyle(color: Colors.white),
                   ),
        color: Colors.deepOrange,
                   ),
      );
      }
     
    );
  }
}