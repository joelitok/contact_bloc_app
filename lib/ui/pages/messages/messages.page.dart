import 'package:contacts_blog_app/bloc/messages/message.action.dart';
import 'package:contacts_blog_app/bloc/messages/message.state.dart';
import 'package:contacts_blog_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_blog_app/enums/enums.dart';
import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/ui/pages/contactsWithMessages/widgets/messages.appbar.widgets.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/contact.info.widgets.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_blog_app/ui/pages/messages/widgets/messages.widget.dart';
import 'package:contacts_blog_app/ui/pages/shared/circular.progress.ind.widget.dart';
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
appBar: MyAppBarWidget(this.contact),
body: Column(
  children: [
 ContactInfoWidget(contact),
MessagesWidget(),

MessagesFormWidget(contact)


 ],)
    );
  }
}