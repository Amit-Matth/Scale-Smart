import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scale Smart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true),
      home: const MyHomePage(title: 'Scale Smart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = '';
  var bgColor = Colors.orange.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          elevation: 11,
          shadowColor: Colors.orangeAccent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.orange.shade400,
          ),
          title: Text(widget.title),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Calculate your BMI',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.all(11),
                  child: TextField(
                      controller: wtController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          labelText: 'Weight in kg',
                          hintText: 'Enter your weight',
                          hintStyle: TextStyle(color: Color(0xffb77012)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2)),
                          suffix: Text(
                            'Kg',
                            style: TextStyle(color: Colors.orange),
                          ),
                          prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.all(5),
                              child: ImageIcon(
                                AssetImage('assets/images/weight.png'),
                                size: 24,
                                color: Color(0xffb77012),
                              )))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11, right: 11),
                  width: 300,
                  child: TextField(
                      controller: ftController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          labelText: 'Height in feet',
                          hintText: 'Enter your height',
                          hintStyle: TextStyle(color: Color(0xffb77012)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2)),
                          suffix: Text(
                            'Ft',
                            style: TextStyle(color: Colors.orange),
                          ),
                          prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.all(5),
                              child: ImageIcon(
                                AssetImage('assets/images/height.png'),
                                size: 24,
                                color: Color(0xffb77012),
                              )))),
                ),
                Container(
                  margin: EdgeInsets.all(11),
                  width: 300,
                  child: TextField(
                      controller: inchController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          labelText: 'Height in inch',
                          hintText: 'Enter your height',
                          hintStyle: TextStyle(color: Color(0xffb77012)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2)),
                          suffix: Text(
                            'Inch',
                            style: TextStyle(color: Colors.orange),
                          ),
                          prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.all(5),
                              child: ImageIcon(
                                AssetImage('assets/images/height.png'),
                                size: 24,
                                color: Color(0xffb77012),
                              )))),
                ),
                SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);
                        var msg = '';

                        if (bmi > 25) {
                          msg = 'You are OverWeight!!';
                          bgColor = Colors.lightGreenAccent.shade100;
                        } else if (bmi < 18) {
                          msg = 'Yor are UnderWeight!!';
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = 'You are Healthy!!';
                          bgColor = Colors.green.shade100;
                        }

                        setState(() {
                          result =
                              '$msg \n Your bmi is: ${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = 'Please fill all the required blanks!';
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.orange),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.orange),
                    ))
              ],
            ),
          ),
        ));
  }
}
