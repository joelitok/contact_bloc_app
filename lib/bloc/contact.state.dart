import 'package:contacts_blog_app/bloc/contact.action.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/contact.model.dart';

class ContactsState {
List<Contact> contacts;
RequestState requestState;
String errorMessage;
ContactsEvent currentEvent;
 
ContactsState({this.contacts,this.requestState,this.errorMessage, this.currentEvent});

}