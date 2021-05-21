import 'package:bloc/bloc.dart';
import 'package:contacts_blog_app/bloc/contact.action.dart';
import 'package:contacts_blog_app/bloc/contact.state.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/repositories/contact.repo.dart';
import 'package:flutter/cupertino.dart';





class ContactsBloc extends Bloc <ContactsEvent, ContactsState>{
  
ContactsRepository contactsRepository;

  ContactsBloc({ContactsState initialState, this.contactsRepository}) : super(initialState);


  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async*{


if(event is LoadAllContactsEvent){
yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);


try {
  List<Contact> data = await contactsRepository.allcontact();
  yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);

}catch (e) {

  yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message,currentEvent: event);


}


   }else if (event is LoadStudentsEvent){


yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);


try {
  List<Contact> data = await contactsRepository.contactByType("Student");
  yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);

}catch (e) {

  yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message,currentEvent: event);


}



   }else if(event is LoadDevelopersEent){

     yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);


try {
  List<Contact> data = await contactsRepository.contactByType("Developer");
  yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);

}catch (e) {

  yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message,currentEvent: event);


}


   }


  }


}



