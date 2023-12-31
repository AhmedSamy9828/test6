import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_note/screens/login.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String id = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamedAndRemoveUntil(LogIn.id, (route) => false);
          },
          icon: const Icon(
            Icons.output,
            color: Colors.black26,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            physics:
            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(w / 17, w / 20, 0, w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FlutterFire Note',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: w / 35),
                    Text(
                      'Flutter Application Note |\n With Firebase Back-End.',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              homePageCardsGroup(
                  Colors.lightGreen,
                  Icons.analytics_outlined,
                  // Icons.gamepad_outlined,
                  // 'Example example',
                  'notes',
                  context,
                  // const Sales(),
                  // const Color(0xffffa700),
                  const Color(0xff63ace5),
                  // Icons.article,
                  Icons.calendar_today_sharp,
                  // 'Example example',
                  'test1',
                  // const Invoices()
              ),
              Padding(
                padding: EdgeInsets.only(bottom: w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    homePageCard(
                      const Color(0xff054fee),
                      Icons.all_inbox_outlined,
                      'test2',
                      context,
                      // const GroupsPage(),
                    ),
                    // homePageCard(color2, icon2, title2, context, route2),
                  ],
                ),
              ),
              SizedBox(height: w / 20),
            ],
          ),
          blurTheStatusBar(context),
        ],
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    getColor(Set<MaterialState> state){
      if(state.contains(MaterialState.pressed)){
        return colorPressed;
      } else {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }
  Widget homePageCardsGroup(
      Color color,
      IconData icon,
      String title,
      BuildContext context,
      // Widget route,
      Color color2,
      IconData icon2,
      String title2,
      // Widget route2
      ) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context,
              // route
          ),
          homePageCard(color2, icon2, title2, context,
              // route2
          ),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, IconData icon, String title,
      BuildContext context,
      // Widget route
      ) {
    double w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            // HapticFeedback.lightImpact();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return route;
            //     },
            //   ),
            // );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            height: w / 2,
            width: w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Container(
                  height: w / 8,
                  width: w / 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color.withOpacity(.6),
                  ),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }

}