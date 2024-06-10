

import 'package:flutter/material.dart';
import 'package:flutter_application_contactsapp/screens/Contact.dart';
import 'package:flutter_application_contactsapp/screens/ContactInformationPage.dart';
import 'package:flutter_application_contactsapp/screens/ContactEntryPage.dart';
import 'package:flutter_application_contactsapp/screens/ContantsDisplayPage.dart';

class Navigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context)=> const ContactDisplayPage());
        
      case '/ContactInformationPage':
        if(args is Contact || args is List<Contact>){
          print('here');
          
          return MaterialPageRoute(builder: (context)=> ContactInformationPage(edit_box: true, contact: args as Contact,contacts: args as List<Contact>,)) ;
        }
        break;


      case "/ContactEntryPage":
      // print('dd');
        if( args is Contact? ){
          print('here in entry page');

          return MaterialPageRoute(builder: (context)=> ContactEntryPage(contacts: [],));
        }

        break;
  
      default:
        return _errorRoute();
    }
    return _errorRoute();

  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (context) => (
        Scaffold(
          appBar: AppBar(title: const Text('Error page',style: TextStyle(fontSize: 20),),),
          body: const Center(
            child: Text('Some Error Occured !!',style: TextStyle(fontSize: 36),) 
          ,),
        )
      ),

    );
  }
}

