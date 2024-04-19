import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const calculator());
}
class calculator extends StatefulWidget{
  const calculator({Key?key}):super(key:key);
  @override
  State<calculator> createState()=>calculatorHomeScreen();
}
class calculatorHomeScreen extends State<calculator>{
  final TextEditingController _calculation=TextEditingController();
  String result="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title: Text("calculator app version 1.0 "),
        ),
        body: Container(alignment:Alignment.center, 
        child:Column(children:[
          Text("created by mesteranas")
          ,TextFormField(controller: _calculation,decoration:InputDecoration(labelText:"type hear" ) ,keyboardType: TextInputType.text,textInputAction:TextInputAction.done ,)
          ,TextButton(onPressed:(){
            var numResult;
            try{
            String calc=_calculation.text;
            Parser p=Parser();
            Expression exp=p.parse(calc);
            ContextModel conmodel=ContextModel();
            numResult=exp.evaluate(EvaluationType.REAL,conmodel);
            } catch(e){
              numResult="error";
            }
    setState(() {
      result=numResult.toString();
    });
  }
           , child: Text("calculate"))
          ,Text(result)
        ])), ) ,
    );
  }
}