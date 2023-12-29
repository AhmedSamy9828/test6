import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterfire_note/screens/home.dart';
import 'package:flutterfire_note/services/firebase/auth.dart';

class SignUp extends StatefulWidget {
  static String id = 'SignUp';

  const SignUp({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  final _auth = Auth();
  late String email;
  late String name;
  late String phone;
  late String password;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: Form(
        key: formstate,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height * (animation2.value + .58),
                    left: size.width * .21,
                    child: CustomPaint(
                      painter: MyPainter(50),
                    ),
                  ),
                  Positioned(
                    top: size.height * .98,
                    left: size.width * .1,
                    child: CustomPaint(
                      painter: MyPainter(animation4.value - 30),
                    ),
                  ),
                  Positioned(
                    top: size.height * .5,
                    left: size.width * (animation2.value + .8),
                    child: CustomPaint(
                      painter: MyPainter(30),
                    ),
                  ),
                  Positioned(
                    top: size.height * animation3.value,
                    left: size.width * (animation1.value + .1),
                    child: CustomPaint(
                      painter: MyPainter(60),
                    ),
                  ),
                  Positioned(
                    top: size.height * .1,
                    left: size.width * .8,
                    child: CustomPaint(
                      painter: MyPainter(animation4.value),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .1),
                          child: Text(
                            'FlutterFire Note',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 4,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              component1(Icons.email_outlined, 'Email...', false, 'Email',
                                (value) {if(value!.isEmpty) {return 'أدخل البريد الإلكتروني';}return null;},),
                              SizedBox(height: size.height /25),
                              component1(Icons.person, 'Name...', false, 'Name',
                                (value) {if(value!.isEmpty) {return 'أدخل إسم المستخدم ';}return null;},),
                              SizedBox(height: size.height /25),
                              component1(Icons.phone, 'Phone...', false, 'Phone',
                                (value) {if(value!.isEmpty) {return 'أدخل رقم الهاتف ';}return null;},),
                              SizedBox(height: size.height /25),
                              component1(Icons.lock_outline, 'Password...', true, 'Password',
                                (value) {if(value!.isEmpty) {return 'أدخل كلمه المرور';}return null;},),
                              SizedBox(height: size.height /10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  component2(
                                    'SIGNUP',
                                    2.58,
                                        () async {
                                      if (formstate.currentState!.validate()){
                                        try {
                                          formstate.currentState!.save();
                                          showLoading(context);
                                          await _auth.signUp(name, phone, email, password);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pop();
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pushNamedAndRemoveUntil(Home.id, (route) => false);
                                        }on FirebaseAuthException catch (e) {
                                          Navigator.of(context).pop();
                                          AwesomeDialog(
                                              context : this.context,
                                              title: 'الحاله',
                                              body:  e.message != null ? Text(e.code)
                                                  : const Text('حدث خطأ ما: بالرجاء المحاوله لاحقاً'),
                                              dialogType: DialogType.warning).show();
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: size.width / 8,
                                  width: size.width / 2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: Colors.white.withOpacity(.05),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    '',
                                    style: TextStyle(color: Colors.white.withOpacity(.8)),
                                  ),
                                ),
                                component2(
                                  'Powered By Blue Atom',
                                  2,
                                      () async{
                                    // const url = 'https://www.facebook.com/BlueAtomHere/?ref=pages_you_manage';
                                    // const url = 'https://api.whatsapp.com/message/C4KV7M5HIGJLC1?autoload=1&app_absent=0';
                                    // const url = 'https://www.facebook.com/blueatom2222';
                                    const url = 'https://blueatom2.com/';
                                    // const url = 'https://wa.me/+0201005538792';
                                    // if(await canLaunch(url)){
                                    //   await launch(
                                    //     url,
                                    //     forceSafariVC: false,
                                    //     forceWebView: true, enableJavaScript: true,
                                    //   );
                                    // }
                                    try {
                                      bool launched = await launch(url, forceSafariVC: false); // Launch the app if installed!
                                      if (!launched) {
                                        launch(url); // Launch web view if app is not installed!
                                      }
                                    } catch (e) {
                                      launch(url); // Launch web view if app is not installed!
                                    }
                                  },
                                ),
                                SizedBox(height: size.height * .05),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              title: Text('أنتظر قليلاً'),
              content: SizedBox(
                  height: 50,
                  child: Center(
                      child: CircularProgressIndicator()
                  )
              )
          );
        }
    );
  }

  Widget component1(IconData icon, String hintText,bool isPassword, String type, valid) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 6,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            validator: valid,
            keyboardType:
            type == 'Email' ? TextInputType.emailAddress
                : type == 'Name' ? TextInputType.name
                : type == 'Phone' ? TextInputType.phone
                : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle:
              TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
            ),
            onSaved:
            type == 'Email' ? (value) {email = value!;}
                :type == 'Name' ? (value) {name = value!;}
                :type == 'Phone' ? (value) {phone = value!;}
                : (value) { password = value!; },
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }

}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
          colors: [Color(0xffFD5E3D), Color(0xffC43990)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        // ignore: prefer_const_constructors
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}