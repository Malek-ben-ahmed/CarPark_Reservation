
import 'package:flutter/material.dart';
import 'package:untitled2/Reservation.dart';


void main() => runApp(Slots());

class Slots extends StatefulWidget {
  const Slots({super.key});
  @override
  State<Slots> createState() => SlotsState();}

class SlotsState extends State<Slots> {
 static var num ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child:Padding(padding:EdgeInsets.only(left:10,top:100,right: 10),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>Reservation()));num=1;} ,child:
        Container(color:Colors.grey[300],width: 150,height: 200,child: Image.asset("images/car-icon.png",height: 150,width: 150,)),),
        Container(color: Colors.transparent,width: 150,height: 50,child:Text("SLOT1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),margin:EdgeInsets.all(20),padding: EdgeInsets.only(left: 50,top: 10),),InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>Reservation()));num=3;} ,child:
        Container(color: Colors.grey[300],width: 150,height: 200,child: Image.asset("images/car-icon.png",height: 150,width: 150,)),),
        Container(color: Colors.transparent,width: 150,height: 50,child:Text("SLOT3",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),margin:EdgeInsets.all(20),padding: EdgeInsets.only(left: 50,top: 10)) ])
      ,Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[ InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>Reservation()));num=2;} ,child:
      Container(color: Colors.grey[300],width: 150,height: 200,child: Image.asset("images/car-icon.png",height: 150,width: 150,)))
        ,Container(color: Colors.transparent,width: 150,height: 50,child:Text("SLOT2",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),margin:EdgeInsets.all(20),padding: EdgeInsets.only(left: 50,top: 10)),InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>Reservation()));num=4;} ,child:
      Container(color: Colors.grey[300],width: 150,height: 200,child: Image.asset("images/car-icon.png",height: 150,width: 150,)),),
        Container(color: Colors.transparent,width: 150,height: 50,child:Text("SLOT4",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),margin:EdgeInsets.all(20),padding: EdgeInsets.only(left: 50,top: 10)),],)],),
    )));
  }
}
