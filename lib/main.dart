import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Reservation.dart';
import 'package:untitled2/slots.dart';
import 'package:untitled2/signin.dart';
import 'package:untitled2/signup.dart';
import 'firebase_options.dart';
import 'homepage.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  void initState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
  @override
  MyAppState createState() => MyAppState();


}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,home: Slots(),
      /*home: FirebaseAuth.instance.currentUser == null ?const Signin():const Homepage() ,*/
      routes: {
        '/signin': (context) => const Signin(),
        '/signup': (context) => const Signup(),
        '/homepage': (context) => const Homepage(),
        '/Lots':(context)=> Slots(),
        'Reservation':(context)=>Reservation(),

      },
    );
  }
}


