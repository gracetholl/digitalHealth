// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(_title), centerTitle: true),
        body: const MyStatefulWidget(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          children: <Widget>[
            Image.asset("assets/images/logo.png", width: 20, height: 70),
            Container(padding: const EdgeInsets.only(bottom: 60)),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 7),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),


            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 7),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:Colors.white,
                        side: BorderSide(width: 1.0, color: Colors.red)),
                  child: const Text('Sign Up', style: TextStyle(color:Colors.red, fontSize:20)),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: nameController.text,
                        password: passwordController.text);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new HomePage()));
                  },
                )),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 5),
                child: ElevatedButton(
                  child: const Text('Login', style: TextStyle(fontSize:20)),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: nameController.text,
                        password: passwordController.text);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new HomePage()));
                  },
                )),
            Container(
              padding: EdgeInsets.fromLTRB(110, 0, 100, 0),
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: nameController.text);
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
                  style: TextStyle(fontSize:15)
              ),
            )),
          ],
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Image.asset('assets/images/whitelogo.png',
                  width: 150, height: 300)),
          body: Builder(
            builder: (context) => ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Theme.of(context).backgroundColor,
                  child: const Text('Welcome!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50, fontFamily: 'Lato', color: Colors.red)),
                ),
                Container(
                  child: const Text('\nNotes to remember:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Lato',
                          color: Colors.black)),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      '\n1. Exercises should be performed 3x a week at a similar time of day.\n\n2. Be sure to repeat exercises bilaterally (both legs, both arms, etc.).\n\n3. Choose resistance based on maximum level that is comfortable.\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Lato',
                          color: Colors.black)),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                FractionallySizedBox(
                    widthFactor: 0.75,
                    child: ElevatedButton(
                      child: const Text('Get Started',
                          style: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Exercise1()));
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}

// Hip Extension
class Exercise1 extends StatefulWidget {
  @override
  State<Exercise1> createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
  int val = -1;
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new HomePage()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 1: Hip Extensions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset("assets/images/hipextension.gif",
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 12 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text('Use Theraband for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        /*Container(
        padding: const EdgeInsets.only(top:100),
      ),*/
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Exercise2()))),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Exercise2 extends StatefulWidget {
  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Exercise1()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 2: Tricep Extensions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset('assets/images/tricepsExtension.gif',
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 8 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text('Use Theraband for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Exercise3()))),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0.14,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Exercise3 extends StatefulWidget {
  @override
  State<Exercise3> createState() => _Exercise3State();
}

class _Exercise3State extends State<Exercise3> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Exercise2()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 3: Chair Squats',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset("assets/images/chairSquats.gif",
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 8 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text(
                              'Use weighted vest for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Exercise4()))),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0.28,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Exercise4 extends StatefulWidget {
  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Exercise3()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 4: Double Arm Lift',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset("assets/images/resistedRowing.gif",
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 8 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text('Use Theraband for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Exercise5()))),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0.42,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Exercise5 extends StatefulWidget {
  @override
  State<Exercise5> createState() => _Exercise5State();
}

class _Exercise5State extends State<Exercise5> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Exercise4()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 5: Step Up and Down',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset("assets/images/stepUp.gif",
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 8 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text(
                              'Use weighted vest for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Exercise6()))),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0.56,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Exercise6 extends StatefulWidget {
  @override
  State<Exercise6> createState() => _Exercise6State();
}

class _Exercise6State extends State<Exercise6> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Exercise5()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 6: Diagonal Reach',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset("assets/images/diagonalReach.gif",
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 8 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text('Use Theraband for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Exercise7()))),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0.70,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Exercise7 extends StatefulWidget {
  @override
  State<Exercise7> createState() => _Exercise7State();
}

class _Exercise7State extends State<Exercise7> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Exercise6()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        Container(
                          child: const Text('\nExercise 7: Calf Raises',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Image.asset("assets/images/calfRaises.gif",
                            width: 80, height: 350),
                        Container(
                          child: const Text(
                              'Directions: 2 sets x 12 reps with 30s rest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          child: const Text(
                              'Use weighted vest for resistance\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.50,
                            child: ElevatedButton(
                              child: const Text('Next Exercise',
                                  style: const TextStyle(fontSize: 18)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        'Did you experience any pain during this exercise?',
                                        style: TextStyle(fontSize: 16)),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("0    None"),
                                                leading: Radio<int>(
                                                    value: 0,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 0;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/happyFace.png")),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("1"),
                                                leading: Radio<int>(
                                                    value: 1,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 1;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("2"),
                                                leading: Radio<int>(
                                                    value: 2,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 2;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("3"),
                                                leading: Radio<int>(
                                                    value: 3,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 3;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("4"),
                                                leading: Radio<int>(
                                                    value: 4,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 4;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("5"),
                                                leading: Radio<int>(
                                                    value: 5,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 5;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("6"),
                                                leading: Radio<int>(
                                                    value: 6,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 6;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("7"),
                                                leading: Radio<int>(
                                                    value: 7,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 7;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("8"),
                                                leading: Radio<int>(
                                                    value: 8,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 8;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("9"),
                                                leading: Radio<int>(
                                                    value: 9,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 9;
                                                      });
                                                    })),
                                            ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                title: Text("10  Very Severe"),
                                                leading: Radio<int>(
                                                    value: 10,
                                                    groupValue: val,
                                                    onChanged: (_val) {
                                                      setState(() {
                                                        val = 10;
                                                      });
                                                    }),
                                                trailing: Image.asset(
                                                    "assets/images/sadFace.png")),
                                          ]);
                                    }),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text('Submit',
                                              style: TextStyle(fontSize: 19)),
                                          onPressed: () => Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Finish())))
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 0.84,
                          ),
                        ),
                      ],
                    ))));
  }
}

class Finish extends StatefulWidget {
  @override
  State<Finish> createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(backgroundColor: Colors.white, primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new HomePage()));
                    }),
                centerTitle: true,
                title: Image.asset('assets/images/whitelogo.png',
                    width: 150, height: 300)),
            body: Builder(
                builder: (context) => ListView(
                      children: <Widget>[
                        /*Container(
                          padding: const EdgeInsets.only(top:50),
                        ),*/

                        Container(
                          child: const Text(
                              '\nCongratulations!\nExercises Completed.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Lato',
                                  color: Colors.red)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                              '\nEach week after treatment, add one repetition.\n\nWhen 8 weeks have passed after treatment, drop reps to the original count and add a set.\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  color: Colors.black)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                              '\nProgram adapted from Lee 2020 - Postoperative Rehabilitation after Hip Fracture and Latham 2014 - Effect of a home-based exercise program on functional recovery following rehabilitation after hip fracture\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 50),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(
                              child: const Text('Back to Home Page',
                                  style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new HomePage()));
                              },
                            )),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const LinearProgressIndicator(
                            value: 1,
                          ),
                        ),
                      ],
                    ))));
  }
}
