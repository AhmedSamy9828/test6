import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_note/firebase_options.dart';
import 'package:flutterfire_note/routes.dart';
import 'package:flutterfire_note/screens/home.dart';
import 'package:flutterfire_note/screens/splash.dart';

late bool isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  User? user = FirebaseAuth.instance.currentUser;
  if(user == null){isLogin = false;}else{isLogin = true;}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store',
      // theme: ThemeData(primarySwatch: Colors.red, appBarTheme: const AppBarTheme(color: Colors.redAccent)),
      theme: ThemeData(
        primarySwatch: Colors.red,
        // backgroundColor: Colors.redAccent,
        backgroundColor: const Color(0xff192028),
        appBarTheme: AppBarTheme(color: Colors.red.shade300,),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLogin == true ? Home.id : Splash.id,
      routes: routes,
    );
  }
}