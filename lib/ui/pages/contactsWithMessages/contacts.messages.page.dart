import 'package:contacts_blog_app/bloc/contact.action.dart';
import 'package:contacts_blog_app/bloc/contact.bloc.dart';
import 'package:contacts_blog_app/bloc/contact.state.dart';
import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/ui/pages/contactsWithMessages/widgets/contact.list.widget.dart';
import 'package:contacts_blog_app/ui/pages/contactsWithMessages/widgets/messages.appbar.widgets.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/messages.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/circular.progress.ind.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsWithMessages extends StatelessWidget {
 

  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());

    return BlocBuilder<MessageBloc,MessagesState>(
      builder: (context,state)=>   Scaffold(
        appBar: MyAppBarWidget(state.currentContact),
        body: Column(
          children: [
          ContactsListHorizontalWidget(),

            MessagesWidget(),

            MessagesFormWidget(state.currentContact),
            
  
 
          ],
        )
      ),
    );
     
  }
}