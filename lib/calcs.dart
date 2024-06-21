import 'dart:math';

import 'package:calculator/bmi.dart';
import 'package:calculator/gst.dart';
import 'package:flutter/material.dart';

class calcs extends StatefulWidget {
  const calcs({super.key});

  @override
  State<calcs> createState() => _calcsState();
}

class _calcsState extends State<calcs> {

  final ctrl = TextEditingController();

  String val1="",val2="",optr="";

  bool clk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 10,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const calcs()),);
                  },
                  child: Text("Calculator",style: TextStyle(fontSize: 10),),
                ),


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 10,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const bmi()),);
                  },
                  child: Text("CalculatorBMI",style: TextStyle(fontSize: 10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 10,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const gst()),);
                  },
                  child: Text("CalculatorGST",style: TextStyle(fontSize: 10)),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 150,),
            TextFormField(
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black,),
                controller: ctrl),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  ctrl.text = "x²";
                  optr = "x²";
                  clk =  true;
                }, child:Text("x²",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "x³";
                  optr = "x³";
                  clk =  true;
                }, child:Text("x³",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "√";
                  optr = "√";
                  clk =  true;
                }, child:Text("√",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "mod";
                  optr = "mod";
                  clk =  true;
                }, child:Text("mod",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
              ],
            ),
        
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  ctrl.text = "";
                  optr = "";
                  clk =  false;
                  val2="";
                  val1="";
                }, child:Text("AC",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){}, child:Icon(Icons.arrow_back,size: 25,color: Colors.black,),),
                ElevatedButton(onPressed: (){
                  if (clk) {
                    double currentValue = double.tryParse(val2) ?? 0;
                    currentValue *= -1;
                    val2 = currentValue.toString();
                    ctrl.text = val2;
                  }
                  else {
                    double currentValue = double.tryParse(val1) ?? 0;
                    currentValue *= -1;
                    val1 = currentValue.toString();
                    ctrl.text = val1;
                  }
                }, child:Text("+/-",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "/";
                  optr = "/";
                  clk =  true;
                }, child:Text("∻",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
              ],
            ),
            SizedBox(height: 25,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += "7";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "7";
                    ctrl.text = val1;
                  }
                }, child: Text("7",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += "8";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "8";
                    ctrl.text = val1;
                  }
                }, child: Text("8",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += "9";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "9";
                    ctrl.text = val1;
                  }
                }, child: Text("9",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "*";
                  optr = "*";
                  clk =  true;
                }, child: Text("*",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
        
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
        
                  if(clk){
                    val2 += "4";
                    ctrl.text=val2;
                  }
                  else{
                    val1 += "4";
                    ctrl.text=val1;
                  }
        
        
                }, child:Text("4",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk){
                    val2 += "5";
                    ctrl.text=val2;
                  }
                  else{
                    val1 += "5";
                    ctrl.text=val1;
                  }
                }, child:Text("5",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk){
                    val2 += "6";
                    ctrl.text=val2;
                  }
                  else{
                    val1 += "6";
                    ctrl.text=val1;
                  }
                }, child:Text("6",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "-";
                  optr = "-";
                  clk =  true;
                }, child:Text("-",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
        
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
        
                  if(clk)
                  {
                    val2 += "1";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "1";
                    ctrl.text = val1;
                  }
        
        
                }, child: Text("1",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += "2";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "2";
                    ctrl.text = val1;
                  }
                }, child: Text("2",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += "3";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "3";
                    ctrl.text = val1;
                  }
                }, child: Text("3",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  ctrl.text = "+";
                  optr= "+";
                  clk =  true;
                }, child: Text("+",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
        
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  ctrl.text = "%";
                  optr= "%";
                  clk =  true;
                }, child:Text("%",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += "0";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += "0";
                    ctrl.text = val1;
                  }
                }, child:Text("0",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  if(clk)
                  {
                    val2 += ".";
                    ctrl.text = val2;
                  }
                  else
                  {
                    val1 += ".";
                    ctrl.text = val1;
                  }
                }, child:Text(".",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),)),
                ElevatedButton(onPressed: (){
                  setState(() {
                    if(optr == "x²") {
                      double a = double.parse(val1);
                      double res = a * a;
                      ctrl.text = res.toString();
                    }
        
                    if(optr == "+")
                    {
                      double a = double.parse(val1);
                      double b = double.parse(val2);
        
                      double res = a + b ;
        
                      ctrl.text = res.toString();
        
                    }
                    if(optr == "-"){
                      double c = double.parse(val1);
                      double d = double.parse(val2);
                      double res = c - d ;
                      ctrl.text=res.toString();
                    }
        
                    if(optr == "*"){
                      double e = double.parse(val1);
                      double f = double.parse(val2);
                      double res = e * f ;
                      ctrl.text=res.toString();
                    }
        
                    if(optr == "/"){
                      double g = double.parse(val1);
                      double h = double.parse(val2);
                      double res = g / h;
                      ctrl.text=res.toString();
                    }
        
                    if(optr == "x³"){
                      double x = double.parse(val1);
                      double res = x*x*x;
                      ctrl.text=res.toString();
                    }
        
                    if(optr == "√"){
                      double g = double.parse(val1);
                      num res = pow(g, (1/2));
                      ctrl.text=res.toString();
                    }

                    if(optr == "mod"){
                      double a = double.parse(val1);
                      double b = double.parse(val2);
                      double res = a - b * (a / b).floor();
                      ctrl.text = res.toString();
                    }



                    if(optr == "%"){
                      double a = double.parse(val1);
                      double b = double.parse(val2);
                      double res = (a*b)/100;
                      ctrl.text=res.toString();
                    }


        
                  }
                  );
        
                }, child:Text("=",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,color: Colors.black),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}