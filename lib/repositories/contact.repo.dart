import 'dart:math';

import 'package:contacts_blog_app/model/contact.model.dart';

class ContactsRepository{

  Map<int,Contact> contacts= {
    1:Contact(id: 1,name: 'joel',profile: 'dev',score: 1234,type: 'Developer'),
    2:Contact(id: 2,name: 'placide',profile: 'tech',score: 123,type: 'Student'),
    3:Contact(id: 3,name: 'hermann',profile: 'com',score: 124,type: 'Student'),
    4:Contact(id: 4,name: 'landry',profile: 'dev',score: 134,type: 'Developer'),
    5:Contact(id: 5,name: 'pascal',profile: 'devO',score: 134,type: 'Student'),
  };


  Future<List<Contact>> allcontact() async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd =new Random().nextInt(10);
    if(rnd>1){
      return contacts.values.toList();

    }else{
      throw new Exception("Internet ERROR");
    }
  }


  Future<List<Contact>> contactByType(String type) async{
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd =new Random().nextInt(9);
    if(rnd>3){
      return contacts.values.toList().where((element) => element.type==type).toList();

    }else{
      throw new Exception("Internet ERROR");
    }
  }
}