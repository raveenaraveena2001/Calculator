import 'package:flutter/material.dart';

import 'calcs.dart';
import 'gst.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  TextEditingController ctrl = TextEditingController();

  void calculateBMI() {
    final double height = double.parse(heightController.text) / 100;
    final double weight = double.parse(weightController.text);

    final double bmi = weight / (height * height);
    ctrl.text = bmi.toStringAsFixed(2);

    String category;
    Color color;

    if (bmi < 18.5) {
      category = "Underweight 😢";
      color = Colors.yellow;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      category = "Normal weight 😍";
      color = Colors.green;
    } else {
      category = "Overweight 😲";
      color = Colors.red;
    }

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            color: color,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    'You are $category',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          );
        });

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Your Height", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: heightController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))
                            ),
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
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
                        child: Text("Your Weight", style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: weightController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))
                            ),
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
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
                        child: Text("Your BMI", style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                              style: TextStyle(fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black,),
                              controller: ctrl),
                        ),
                      ),
                    ],
                  )
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {
                  calculateBMI();
                },
                    child: Text("Calculate", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),))
              ],
            ),
          ),
        ),

      );
    }
  }


