import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/target_focus.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:tutorialcoachmarkapp/MyContiner.dart';

import 'Util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tutorial Coach Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDemo(),
    );
  }
}

class MyDemo extends StatefulWidget {
  @override
  _MyDemoState createState() => _MyDemoState();
}

class _MyDemoState extends State<MyDemo> {
  List<TargetFocus> targets = List();


  GlobalKey keyButtonHome = GlobalKey();
  GlobalKey keyButtonSetting = GlobalKey();
  GlobalKey keyButtoAction = GlobalKey();

  @override
  void initState() {
    initTargets();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
              title: Text('My Tutorial Coach Demo'),
              backgroundColor: Colors.red,
              leading: GestureDetector(
                key: keyButtonHome,
                onTap: () {
                  showTutorial();
                },
                child: Icon(
                  Icons.menu, // add custom icons also
                ),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    key: keyButtonSetting,
                    child: GestureDetector(
                      onTap: ()
                      {

                      },
                      child: Icon(
                        Icons.settings,
                        size: 26.0,
                      ),
                    )),
              ]),
          body: Container(),
          floatingActionButton: FloatingActionButton(
            key: keyButtoAction,
            onPressed: () {},
            child: Icon(
              Icons.add_location,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          ));

  }

  void _afterLayout(_) {
    Future.delayed(Duration(milliseconds: 100), () {
      showTutorial();
    });
  }

  void initTargets()
  {
    targets.add(TargetFocus(
      identify: "home",
      keyTarget: keyButtonHome,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: MyContainer(
              title: Util.myHomeTitle,
              description: Util.myHomeDescription,
              )

        )
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "Setting",
      keyTarget: keyButtonSetting,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: MyContainer(
              title: Util.myProfileTitle,
              description: Util.myProfileDescription,
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "location",
      keyTarget: keyButtoAction,
      contents: [
        ContentTarget(
            align: AlignContent.top,
            child: MyContainer(
              title: Util.myLocationTitle,
              description: Util.myLocationDescription,
              icon: Icons.location_on,
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));


  }

  void showTutorial()
  {
    TutorialCoachMark(context,
        targets: targets,
        colorShadow: Colors.green,
        textSkip: "SKIP",
        paddingFocus: 10,
        opacityShadow: 0.8, finish: () {
        print("finish");
    }, clickTarget: (target) {
      print(target);
    }, clickSkip: () {
      print("skip");
    },
    alignSkip: Alignment.bottomLeft)
      ..show();
  }
}
