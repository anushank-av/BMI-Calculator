import 'package:flutter/material.dart';
import 'dart:math';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }

}

class Calculator extends StatefulWidget{
  @override
  State createState()=>_CalculatorState();

}

class _CalculatorState extends State<Calculator>{

  var input1;
  var input2;
  var result;

  final cont1=TextEditingController();
  final cont2=TextEditingController();


  @override
  void initState() {
    super.initState();
    input1=0;
    input2=0;
    result=0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'.toUpperCase(),
          style: TextStyle(
            letterSpacing: 4.0,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter height in Metres',
                    ),
                    keyboardType: TextInputType.number,
                    controller: cont1,
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter weight in KG',
                      ),
                      keyboardType: TextInputType.number,
                      controller: cont2,
                ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            Center(
              child: RaisedButton(
                color:Colors.red,
                textColor: Colors.white,
                child: Text("Calculate".toUpperCase()),
                onPressed: (){
                  setState(() {
                      input1 = double.parse(cont1.text);
                      input2 = double.parse(cont2.text);
                      result = input2/pow(input1, 2);
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.red[400],
                highlightColor: Colors.red[300],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Text(
                'Your BMI is : ${result.toStringAsFixed(2)} ',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );

  }


}