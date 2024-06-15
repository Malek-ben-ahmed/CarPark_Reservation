import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/signin.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
  }
  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
     FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  }
  TextEditingController username =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  @override
  bool _obscureText=true;
  bool _check=false;
  void check(){
    setState(() {
      _check=! _check ;
    });
  }
  void togglepassword(){
    setState(() {
      _obscureText=! _obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[SizedBox(height: 30),Row(mainAxisAlignment: MainAxisAlignment.end,children: [ TextButton(onPressed: null, child:Text("Skip",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 23)))]),SizedBox(height: 70),
              Text(
                "Create your account ",
                style: TextStyle(color: Colors.black, fontSize: 30,fontWeight:FontWeight.bold ),textAlign:TextAlign.right,
              ),SizedBox(height: 30),TextField(controller:username,
                  decoration: InputDecoration(hintText: "Username",prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),SizedBox(height: 20),TextField(controller:email ,
                  decoration: InputDecoration(hintText: "e-mail",prefixIcon: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),SizedBox(height: 20),TextField(obscureText: _obscureText,controller: password,
                  decoration: InputDecoration(hintText: "Password",prefixIcon: Icon(Icons.lock),suffixIcon:IconButton(onPressed: (){togglepassword();}, icon: Icon(Icons.remove_red_eye)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),SizedBox(height: 20),TextField(obscureText: _obscureText,
                  decoration: InputDecoration(hintText: "Confirm Password",prefixIcon: Icon(Icons.lock),suffixIcon: IconButton(onPressed: (){togglepassword();}, icon: Icon(Icons.remove_red_eye)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),SizedBox(height: 5),Row(mainAxisAlignment:MainAxisAlignment.start,children:[
                Checkbox(value: _check, onChanged: (bool_check){check();}),Text("I agree with privacy and policy",style: TextStyle(color: Colors.black))]),SizedBox(height: 30),
              Container(height:60,width:320,child:ElevatedButton(onPressed:()async{try {
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
                Navigator.of(context).pushReplacementNamed('/homepage');
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(color: Colors.deepPurple, width: 50),
                  ),
                ),
                child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              )),
              SizedBox(height: 30),Text("Or continue with"),Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children:[TextButton(onPressed: (){signInWithFacebook();},
                      child:Image(image: AssetImage('images/facebookicon.png'),width: 40,height: 40)),TextButton(onPressed:(){ signInWithGoogle() ;},
                      child: Image(image: AssetImage('images/chromeicon.jpg'),width: 50,height: 50)),TextButton(onPressed: null,
                      child: Image(image: AssetImage('images/telephoneicon.png'),width: 40,height: 40)),
                  ]),
              SizedBox(height: 10),Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Already have an account?    "),OutlinedButton(onPressed:(){
                Navigator.pop(context,MaterialPageRoute(builder:(contexte)=>Signin()));
                ;}, child: Text("Sign In"))],)],
          ),
        ));
  }}