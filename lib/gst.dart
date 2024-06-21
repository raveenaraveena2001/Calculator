import 'package:flutter/material.dart';

import 'bmi.dart';
import 'calcs.dart';
import 'gst.dart';

class gst extends StatefulWidget {
  const gst({super.key});

  @override
  State<gst> createState() => _gstState();
}

class _gstState extends State<gst> {

  TextEditingController price = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController originalprice = TextEditingController();
  TextEditingController gstamount = TextEditingController();
  TextEditingController inclusive = TextEditingController();
  TextEditingController exclusive = TextEditingController();

  void calculateGST() {
    double priceValue = double.tryParse(price.text)?? 0.0 ;
    double gstRate = double.tryParse(gst.text) ?? 0.0;

    double gstAmount = (priceValue * gstRate) / 100;

    double exclusivePrice = priceValue + gstAmount;

    double originalPrice = priceValue/(1+gstRate/100);

    double inclusivePrice = priceValue - originalPrice;


    gstamount.text = gstAmount.toStringAsFixed(2);
    exclusive.text = exclusivePrice.toStringAsFixed(2);
    inclusive.text = inclusivePrice.toStringAsFixed(2);
  }

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
            ],
          ),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Price", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: TextFormField(
                          controller: price,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))
                          ),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" GST% ", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: TextFormField(
                          controller: gst,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))
                          ),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                )),
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("GSTAmount", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: TextFormField(
                          controller: gstamount,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))
                          ),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Inclusive GST", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: TextFormField(
                          controller: inclusive,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))
                          ),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Exclusive GST", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: TextFormField(
                          controller: exclusive,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))
                          ),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                )),
              ),
          
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {
                calculateGST();
              },
                  child: Text("Calculate", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),)),
            ],
          ),
        ),
      );
    }
  }

