import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/signup.dart';
import 'package:untitled2/slots.dart';

void main() => runApp(Reservation());
class Reservation extends StatefulWidget {

   const Reservation({super.key});
  @override
 State <Reservation> createState() => ReservationState();}

class ReservationState extends State<Reservation>{
  get isEnabled => null;

  Future<void>_selectDate()async{
    DateTime? picked= await showDatePicker(
      context:context,
      initialDate:DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    Date.text=picked.toString().split(' ')[0];}
    Future<void> _selectTime(BuildContext context)  async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      var p = pickedTime.toString().split('(')[1];
      Time.text = p.split(')')[0];
    }
    void putprice(){
     if(Duration.text !=null){
      var prix=double.parse(Duration.text)*2500 ;
       Price.text=prix.toString();}}
  void putnum(){
    slot_number.text=SlotsState.num.toString();
  }
  @override
  TextEditingController slot_number=TextEditingController();
  TextEditingController Date=TextEditingController();
  TextEditingController Time=TextEditingController();
  TextEditingController Duration=TextEditingController();
  TextEditingController Price=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(

        body:SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[const SizedBox(height: 30), Row(mainAxisAlignment: MainAxisAlignment.end,children: [ TextButton(onPressed:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup() ));},child:Text("Skip",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 23)))]),const SizedBox(height: 70),
              const Text(
                "Book your slot ",
                style: TextStyle(color: Colors.black, fontSize: 30,fontWeight:FontWeight.bold ),textAlign:TextAlign.right,
              ),const SizedBox(height: 30),TextField(controller:slot_number,onTap: (){putnum();},
                  decoration: const InputDecoration(hintText: "Slot Number",prefixIcon: Icon(Icons.car_crash_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),const SizedBox(height: 20),TextField(controller:Date,onTap: (){_selectDate();},
                  decoration: const InputDecoration(hintText: "Date",prefixIcon: Icon(Icons.date_range_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),const SizedBox(height: 20),TextField(controller: Time,onTap: (){_selectTime(context);},
                  decoration: InputDecoration(hintText: "Time",prefixIcon: const Icon(Icons.timelapse_rounded),
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),const SizedBox(height: 20),TextField(controller: Duration,
                  decoration: InputDecoration(hintText: "Duration",prefixIcon: const Icon(Icons.timer),
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),const SizedBox(height: 20),TextField(controller: Price,onTap: (){putprice();},
                  decoration: InputDecoration(hintText: "Total Price",prefixIcon: const Icon(Icons.price_change_rounded),
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  )),const SizedBox(height: 30),
              SizedBox(height:60,width:320,child:ElevatedButton(onPressed:(){},  style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.blueAccent, width: 50),
                ),
              ),
                child: const Text('BOOK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              )),],
          ),
        )));
  }

}