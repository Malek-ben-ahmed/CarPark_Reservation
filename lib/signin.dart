import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'homepage.dart';






class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => SigninState();
}
class SigninState extends State<Signin> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
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
  @override
  bool _obscureText=true;
  bool _checkboxv=false;
  void checkboxvalue(){
    setState(() {
      _checkboxv=! _checkboxv ;
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
                children: <Widget>[SizedBox(height: 30),Row(mainAxisAlignment: MainAxisAlignment.end,children: [ TextButton(onPressed: null, child:Text("Skip",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 23)))]),SizedBox(height: 20),
                  Row(mainAxisAlignment:MainAxisAlignment.center,children: [Image(image: AssetImage('images/signimage.png'),width: 300,height: 150,)],),
                  Text(
                    "Hello, welcome back!",
                    style: TextStyle(color: Colors.black, fontSize: 30,fontWeight:FontWeight.bold ),textAlign:TextAlign.right,
                  ),SizedBox(height: 40),TextField(controller: email,
                      decoration: InputDecoration(hintText: "e-mail",prefixIcon: Icon(Icons.email_rounded),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),SizedBox(height: 20),TextField(controller: password,obscureText:_obscureText,
                      decoration: InputDecoration(hintText: "Password",prefixIcon: Icon(Icons.lock),suffixIcon: IconButton(onPressed: (){togglepassword();}, icon: Icon(Icons.remove_red_eye)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),SizedBox(height: 20),Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                    Row(children:[Checkbox(value: _checkboxv, onChanged:(bool_checkboxv){checkboxvalue();}),Text("Remember me",style: TextStyle(color: Colors.black))]),
                    TextButton(onPressed: ()async{await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);}, child: Text("Forgot password ?",style: TextStyle(color:Colors.deepPurple),))],
                  ),SizedBox(height: 30),Container(height:60,width:320,child:ElevatedButton(onPressed:()async{try {
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                    );
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email!!!!!!!!!!!!');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user!!!!');
                    }
                  }},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: Colors.deepPurple, width: 50),
                      ),
                    ),
                    child: Text('Sign In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  ))
                  ,SizedBox(height: 30),Text("Or continue with"),Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:[TextButton(onPressed: null,
                          child:Image(image: AssetImage('images/facebookicon.png'),width: 40,height: 40)),TextButton(onPressed: (){signInWithGoogle();},
                          child: Image(image: AssetImage('images/chromeicon.jpg'),width: 50,height: 50)),TextButton(onPressed: null,
                          child: Image(image: AssetImage('images/telephoneicon.png'),width: 40,height: 40)),
                      ]),
                  SizedBox(height: 20),Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Don't have an account?    "),OutlinedButton(onPressed: () {
                    Navigator.push(context ,MaterialPageRoute(builder: (context)=>Signup()));},child: Text("Sign up")

                  )],
                  )])));
  }
}
