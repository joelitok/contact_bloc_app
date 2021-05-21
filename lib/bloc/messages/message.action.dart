

import 'package:contacts_blog_app/model/contact.model.dart';
import 'package:contacts_blog_app/model/message.model.dart';

abstract class MessageEvent <T>{
  T payload;
  MessageEvent(this.payload);
}

class MessageByContactEvent extends MessageEvent<Contact>{
  MessageByContactEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessageEvent<Message>{
  AddNewMessageEvent(Message payload) : super(payload);
}
