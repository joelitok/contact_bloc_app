import 'package:contacts_blog_app/bloc/contact.bloc.dart';
import 'package:contacts_blog_app/bloc/contact.state.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/repositories/contact.repo.dart';
import 'package:contacts_blog_app/repositories/message.repository.dart';
import 'package:contacts_blog_app/ui/pages/contacts/contacts.page.dart';
import 'package:contacts_blog_app/ui/pages/contactsWithMessages/contacts.messages.page.dart';
import 'package:contacts_blog_app/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepository());
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
    BlocProvider(create: (context)=>MessageBloc(
    initialState: MessagesState.initialState(),
    messagesRepository: GetIt.instance<MessagesRepository>()
  )),

  BlocProvider(create: (context)=>ContactsBloc(
  initialState: ContactsState(
    
contacts: [],errorMessage: '',
requestState: RequestState.NONE),
contactsRepository: GetIt.instance<ContactsRepository>() ,
messageBloc: context.read<MessageBloc>()                    


  ),),
  
  
      ],
      child: MaterialApp(
debugShowCheckedModeBanner : false,
theme: ThemeData(primarySwatch: Colors.deepOrange),
routes: {
  '/contacts':(context)=>ContactsPage(),
  '/messages':(context)=>MessagesPage(),
  '/contactWithMessages':(context)=>ContactsWithMessages()
},
initialRoute: '/contacts',
      ),
    );
  }
}



