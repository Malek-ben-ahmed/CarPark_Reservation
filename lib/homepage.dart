import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Homepage());
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});


  @override
  MyAppState createState() => MyAppState();


}

class MyAppState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar:AppBar(backgroundColor: Colors.deepPurple[400],title:const Text('Home Page',style:
      TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
          actions:[IconButton(icon: const Icon(Icons.logout), onPressed: () async
          {await FirebaseAuth.instance.signOut();Navigator.of(context).pushReplacementNamed('/signin');})]),body: Column(children: [
      FirebaseAuth.instance.currentUser!.emailVerified ? TextButton(onPressed: (){Navigator.of(context).pushReplacementNamed('/recherche');},child: Text("welcome",textAlign: TextAlign.center,style: TextStyle(color: Colors.deepPurple[600]),)):TextButton(
          onPressed:(){FirebaseAuth.instance.currentUser!.sendEmailVerification();},
          child:const Text("sendEmailVerification",textAlign:TextAlign.center,))],)

    ));
  }}