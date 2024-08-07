import 'package:app/auth.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override 
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return HomePage();
        } else {
        return const LoginPage();
        }
    },
        
      );
  }
}
