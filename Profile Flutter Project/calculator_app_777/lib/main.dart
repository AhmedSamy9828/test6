// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


/// ###################################
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Calculator'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key,required this.title});
//
//   final String title;
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   String output = "0";
//
//   String _output = "0";
//   double num1 = 0.0;
//   double num2 = 0.0;
//   String operand = "";
//
//   buttonPressed(String buttonText){
//
//     if(buttonText == "CLEAR"){
//
//       _output = "0";
//       num1 = 0.0;
//       num2 = 0.0;
//       operand = "";
//
//     } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
//
//       num1 = double.parse(output);
//
//       operand = buttonText;
//
//       _output = "0";
//
//     } else if(buttonText == "."){
//
//       if(_output.contains(".")){
//         // print("Already conatains a decimals");
//         return;
//
//       } else {
//         _output = _output + buttonText;
//       }
//
//     } else if (buttonText == "="){
//
//       num2 = double.parse(output);
//
//       if(operand == "+"){
//         _output = (num1 + num2).toString();
//       }
//       if(operand == "-"){
//         _output = (num1 - num2).toString();
//       }
//       if(operand == "X"){
//         _output = (num1 * num2).toString();
//       }
//       if(operand == "/"){
//         _output = (num1 / num2).toString();
//       }
//
//       num1 = 0.0;
//       num2 = 0.0;
//       operand = "";
//
//     } else {
//
//       _output = _output + buttonText;
//
//     }
//
//     // print(_output);
//
//     setState(() {
//
//       output = double.parse(_output).toStringAsFixed(2);
//
//     });
//
//   }
//
//   Widget buildButton(String buttonText) {
//     return Expanded(
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.all(24.0),
//           textStyle: const TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         child: Text(buttonText),
//         // padding: const EdgeInsets.all(24.0),
//         // child: Text(buttonText,
//         //   style: const TextStyle(
//         //       fontSize: 20.0,
//         //       fontWeight: FontWeight.bold
//         //   ),
//         // ),
//         onPressed: () =>
//             buttonPressed(buttonText)
//         ,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Container(
//                 alignment: Alignment.centerRight,
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 24.0,
//                     horizontal: 12.0
//                 ),
//                 child: Text(output, style: const TextStyle(
//                   fontSize: 48.0,
//                   fontWeight: FontWeight.bold,
//
//                 ))),
//             const Expanded(
//               child: Divider(),
//             ),
//
//
//             Column(children: [
//               Row(children: [
//                 buildButton("7"),
//                 buildButton("8"),
//                 buildButton("9"),
//                 buildButton("/")
//               ]),
//
//               Row(children: [
//                 buildButton("4"),
//                 buildButton("5"),
//                 buildButton("6"),
//                 buildButton("X")
//               ]),
//
//               Row(children: [
//                 buildButton("1"),
//                 buildButton("2"),
//                 buildButton("3"),
//                 buildButton("-")
//               ]),
//
//               Row(children: [
//                 buildButton("."),
//                 buildButton("0"),
//                 buildButton("00"),
//                 buildButton("+")
//               ]),
//
//               Row(children: [
//                 buildButton("CLEAR"),
//                 buildButton("="),
//               ])
//             ])
//           ],
//         ));
//   }
// }


/// ################


// import 'package:flutter/material.dart';
// import 'home_page.dart';
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Calculator App",
//       theme:  ThemeData(primarySwatch: Colors.red),
//       home:  const HomePage(),
//     );
//   }
// }


/// ###################
/// ###################


// /*
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * FLUTTER FLEX CALCULATOR * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * AUTHOR:SHEHRIYAR SHARIQ * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * REQUIRES MATH_EXPRESSIONS PACKAGE TO FUNCTION * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  */
//
// /*
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * FLUTTER FLEX CALCULATOR * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * AUTHOR:SHEHRIYAR SHARIQ * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * REQUIRES MATH_EXPRESSIONS PACKAGE TO FUNCTION * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//  */
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:math_expressions/math_expressions.dart';
//
// void main() => runApp(MyApp()); // App Entry Point
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIOverlays([]);
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//
//     return MaterialApp(
//       title: 'Calculator',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Calculator(), // Calculator Widget
//     );
//   }
// }
//
// class Calculator extends StatefulWidget {
//   @override
//   CalculatorState createState() => CalculatorState();
// }
//
// class CalculatorState extends State<Calculator> {
//   String equation = "0", result = "0"; // Expression and FinalResult
//   Map<String, String> operatorsMap = {"÷": "/", "×": "*", "−": "-", "+": "+"};
//   List buttonNames = [
//     "7",
//     "8",
//     "9",
//     "÷",
//     "4",
//     "5",
//     "6",
//     "×",
//     "1",
//     "2",
//     "3",
//     "−",
//     "0",
//     ".",
//     "⌫",
//     "+"
//   ];
//
//   void evaluateEquation() {
//     try {
//       // Fix equation
//       Expression exp = (Parser()).parse(operatorsMap.entries.fold(
//           equation, (prev, elem) => prev.replaceAll(elem.key, elem.value)));
//
//       double res = double.parse(
//           exp.evaluate(EvaluationType.REAL, ContextModel()).toString());
//
//       // Output correction for decimal results
//       result = double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
//           ? res.toStringAsFixed(0)
//           : res.toStringAsFixed(4);
//     } catch (e) {
//       result = "Error";
//     }
//   }
//
//   Widget? _buttonPressed(String text, {bool isClear = false}) {
//     setState(() {
//       if (isClear) {
//         // Reset calculator
//         equation = result = "0";
//       } else if (text == "⌫") {
//         // Backspace
//         equation = equation.substring(0, equation.length - 1);
//         if (equation == "") equation = result = "0"; // If all empty
//       } else {
//         // Default
//         if (equation == "0" && text != ".") equation = "";
//         equation += text;
//       }
//
//       // Only evaluate if correct expression
//       if (!operatorsMap.containsKey(equation.substring(equation.length - 1)))
//         evaluateEquation();
//     });
//   }
//
//   // Grid of buttons
//   Widget _buildButtons() {
//     return Material(
//       color: Color(0xFFF2F2F2),
//       child: GridView.count(
//           crossAxisCount: 4, // 4x4 grid
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           padding: const EdgeInsets.all(8),
//           children: buttonNames.map<Widget>((e) {
//             switch (e) {
//               case "+": // Addition Button
//                 return _buildFancyButton(e, isBottom: true);
//               case "×": // Multiplication Button
//                 return _buildFancyButton(e);
//               case "−": // Subtraction Button
//                 return _buildFancyButton(e);
//               case "÷": // Division Button
//                 return _buildFancyButton(e, isTop: true);
//               default:
//                 return _button(e, 0);
//             }
//           }).toList()),
//     );
//   }
//
//   // Normal button
//   Widget _button(text, double paddingBot) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Material(
//         borderRadius: BorderRadius.all(Radius.circular(100)), // Circular
//         color: Color.fromRGBO(230, 230, 230, 1),
//         child: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                 return InkWell(
//                   // Ripple Effect
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                   onTap: () {
//                     _buttonPressed(text);
//                   },
//                   child: Container(
//                     // For ripple area
//                     width: constraints.maxWidth,
//                     height: constraints.maxHeight,
//                     alignment: Alignment.center,
//                     child: Text(
//                       text,
//                       style: TextStyle(
//                         color: Color.fromRGBO(94, 94, 94, 1),
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ),
//     );
//   }
//
//   // Operator Button
//   Widget _buildFancyButton(text, {bool isTop = false, bool isBottom = false}) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(8, isTop ? 8 : 0, 8, isBottom ? 8 : 0),
//       child: Material(
//         color: Color.fromRGBO(237, 65, 53, 1),
//         borderRadius: BorderRadius.vertical(
//             top: isTop ? Radius.circular(100.0) : Radius.circular(0),
//             bottom: isBottom ? Radius.circular(100.0) : Radius.circular(0)),
//         child: InkWell(
//           borderRadius: BorderRadius.vertical(
//               top: isTop ? Radius.circular(100.0) : Radius.circular(0),
//               bottom: isBottom ? Radius.circular(100.0) : Radius.circular(0)),
//           onTap: () {
//             _buttonPressed(text);
//           },
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Color.fromRGBO(255, 211, 215, 1),
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             // Expression Area - Top - Smallest Size
//             flex: 1,
//             child: Container(
//               margin: EdgeInsets.only(left: 12.5, right: 12.5),
//               decoration: BoxDecoration(
//                 // Bottom Divider
//                 border: Border(
//                   bottom: BorderSide(
//                     color: Color.fromRGBO(227, 227, 227, 1),
//                   ),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     // Expression
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
//                     child: Row(
//                       children: <Widget>[
//                         Text(equation,
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 color: Color.fromRGBO(152, 152, 152, 1),
//                                 fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // Clear Btn
//                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         InkWell(
//                           borderRadius: BorderRadius.circular(100.0),
//                           onTap: () => {_buttonPressed("×", isClear: true)},
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 45,
//                             width: 45,
//                             child: Text(
//                               "×",
//                               style: TextStyle(
//                                   fontSize: 36,
//                                   color: Color.fromRGBO(200, 200, 200, 1),
//                                   fontWeight: FontWeight.w300),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             // Result Area - Mid - Medium Size Ratio
//             flex: 3,
//             child: Container(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(14, 8, 14, 0),
//                 child: Text(
//                   result,
//                   style: TextStyle(
//                       color: Color.fromRGBO(227, 227, 227, 1),
//                       fontSize: 70,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'Chivo'),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             // Controls Area - Bottom - Max Size Ration
//             flex: 5,
//             child: _buildButtons(),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// ///################
// ///################
// ///################


import "package:flutter/material.dart";
void main(){
  runApp( MyApp());
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget{
  TextEditingController result=TextEditingController();

  MyApp({super.key});
  @override
  Widget build(BuildContext context)
  => MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                        autofocus:true,
                        controller:result,
                        readOnly:true,
                        keyboardType:TextInputType.none,
                        style:const TextStyle(fontSize:40,fontWeight:FontWeight.w500,color:Colors.white),
                        textAlign:TextAlign.right,
                        textAlignVertical:TextAlignVertical.bottom,
                        decoration:const InputDecoration(
                            hintText:"0",
                            hintStyle: TextStyle(color:Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.amber,width:2)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.amber,width:2)
                            )
                        )
                    ),
                  ),
                  const SizedBox(height:3),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ElevatedButton(
                              onPressed:()=>result.text=result.text.isNotEmpty?result.text.substring(0,result.text.length-1):'',
                              onLongPress:()=>result.text='',
                              style:ElevatedButton.styleFrom(
                                  backgroundColor:Colors.black,
                                  shadowColor:Colors.white,
                                  side:const BorderSide(color:Colors.red,width:2)
                              ),
                              child:const Icon(Icons.backspace_outlined,color:Colors.red),
                            ),
                          ),
                        ),
                        buildButtonItem("/"),
                        buildButtonItem("*"),
                        buildButtonItem("-"),
                      ],
                    ),
                  ),
                  Expanded(
                      flex:2,
                      child:Row(
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children:[
                          Expanded(
                            flex:3,
                            child: Column(
                                children:[
                                  Expanded(
                                    child: Row(
                                        crossAxisAlignment:CrossAxisAlignment.stretch,
                                        children:[
                                          buildButtonItem('7'),
                                          buildButtonItem('8'),
                                          buildButtonItem('9'),
                                        ]
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                        crossAxisAlignment:CrossAxisAlignment.stretch,
                                        children:[
                                          buildButtonItem('4'),
                                          buildButtonItem('5'),
                                          buildButtonItem('6'),
                                        ]
                                    ),
                                  )
                                ]
                            ),
                          ),
                          buildButtonItem("+")
                        ],
                      )
                  ),
                  Expanded(
                      flex:2,
                      child:Row(
                          crossAxisAlignment:CrossAxisAlignment.stretch,
                          children:[
                            Expanded(
                              flex:2,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children:[
                                    Expanded(
                                      child:Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children:[
                                            buildButtonItem('1'),
                                            buildButtonItem('2'),
                                          ]
                                      ),
                                    ),
                                    buildButtonItem('0')
                                  ]
                              ),
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.stretch,
                                  children:[
                                    buildButtonItem('3'),
                                    buildButtonItem('.'),
                                  ]
                              ),
                            ),
                            buildButtonItem('=',Colors.green)
                          ]
                      )
                  )
                ]
            ),
          ),
        ),
      )
  );
  Expanded buildButtonItem([String text='',Color color=Colors.blue])
  => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            side:BorderSide(width:2,color:color),
            backgroundColor: Colors.black,
            shadowColor: Colors.white,
          ),
          child:Text(
              text,
              style:TextStyle(fontSize:30,color:color)
          ),
          onPressed:()=>text!='='?result.text=result.text+text:eval()
      ),
    ),
  );
  void eval()
  {
    try{
      while(result.text.contains(RegExp(r"[*/]")))
      {
        RegExp regex = RegExp(r'-?(?:\d+\.?|\d*\.\d+)?[*/]-?(?:\d+\.?|\d*\.\d+)');
        String x = regex.firstMatch(result.text)!.group(0)!;
        if(x.contains('*')){
          final List<String> y = x.split('*');
          result.text=result.text.replaceFirst(x,(double.parse(y[0])*double.parse(y[1])).toString());
        }else if(x.contains('/')){
          final List<String> y = x.split('/');
          result.text=result.text.replaceFirst(x,(double.parse(y[0])/double.parse(y[1])).toString());
        }
      }
      while(result.text.contains(RegExp(r"\d\+|\.\+|\d-|\.-")))
      {
        RegExp regex = RegExp(r'-?(?:\d+\.?|\d*\.?\d+)[+\-]-?(?:\d+\.?|\d*\.?\d+)');
        String x = regex.firstMatch(result.text)!.group(0)!;
        if(x.contains('+')){
          final List<String> y = x.split('+');
          result.text=result.text.replaceFirst(x,(double.parse(y[0])+double.parse(y[1])).toString());
        }else if(x.contains('-')){
          final List<String> y = x.split(RegExp('(?<=.)-'));
          result.text=result.text.replaceFirst(x,(double.parse(y[0])-double.parse(y[1])).toString());
        }
      }
      double x = double.parse(result.text);
      result.text=x==x.toInt()?x.toInt().toString():double.parse(x.toStringAsFixed(10)).toString();
    }catch(e){
      if(result.text!='') {
        result.text='Error';
      }
    }
  }
}