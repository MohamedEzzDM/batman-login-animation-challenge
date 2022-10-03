import 'package:batman/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/animate_list.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BatMan',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * 3 / 5,
            child: Stack(
              children: [
                Image.asset(
                  "lib/assets/images/batman_background.png",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Animate(
                  effects: [
                    ScaleEffect(
                      begin: getProportionateScreenHeight(4),
                      delay: 2.seconds,
                      curve: Curves.linear,
                      duration: 1.seconds
                    )
                  ],
                  child: Image.asset(
                    "lib/assets/images/batman_alone.png",
                    width: double.infinity,
                  ),
                ),
                Animate(
                  effects: [
                    ScaleEffect(
                        duration: 1.seconds, begin: getProportionateScreenHeight(50), curve: Curves.easeOutQuart),
                    ThenEffect(),
                    MoveEffect(
                      duration: 1.seconds,
                      curve: Curves.linear,
                      begin: Offset(0,40),
                      end: Offset(0,-5)
                    )

                  ],
                  child: Positioned(
                    top: SizeConfig.screenHeight / 2.6,
                    right: SizeConfig.screenWidth / 2.80,
                    child: Image.asset(
                      "lib/assets/images/batman_logo.png",
                      width: 120,
                      height: 60,
                    ),
                  ),
                ),
                Align(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: AnimateList(
                        effects: [
                          FadeEffect(
                            curve: Curves.linear,
                              duration: 1.seconds, delay: Duration(seconds: 1))
                        ],
                        children: [
                          Text(
                            "WELCOME TO",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(30),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "GOTHAM CITY",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(40),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(

              children: AnimateList(

                effects: [
                  MoveEffect(
                    begin: Offset(0, getProportionateScreenHeight(300)),
                      duration: 1.seconds,
                  delay: 2.seconds,)],
                children: [
                SizedBox(
                  height: getProportionateScreenHeight(70),
                ),
                Container(
                  height: getProportionateScreenHeight(60),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        backgroundColor: Color(0xFFFCE76A)),
                    child: const Text("LOGIN",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(60),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        backgroundColor: Color(0xFFFCE76A)),
                    child: const Text("SIGN UP",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                )
              ],
              )),
          )
        ],
      )),
    );
  }
}
