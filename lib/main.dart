// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(_title), centerTitle:true),
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

        padding: const EdgeInsets.only(top:100),
        child: ListView(
          children: <Widget>[
            Image.asset("assets/images/logo.png", width:20, height:70),
            Container(
                padding: const EdgeInsets.only(bottom: 60)
            ),
            Container(

              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                  },
                )
            ),
          ],
        ));
  }
}


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),

            body: Builder(
              builder: (context) =>
              ListView(
            children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Theme.of(context).backgroundColor,
                    child: const Text(
                      'Welcome!',
                        textAlign: TextAlign.center,
                    style: TextStyle(fontSize:50, fontFamily: 'PlayfairDisplay', color: Colors.red)),
                  ),
                Container(
                  padding:const EdgeInsets.only(top:490),
                ),

            FractionallySizedBox(
              widthFactor: 0.5,
              child: ElevatedButton(

                    child: const Text('Get Started', style: const TextStyle(fontSize: 15)),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise1()));
                    },
                  )
            )],
        ),),));
  }

}

class Exercise1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),
            body: Builder(
    builder: (context) =>
    ListView(
    children: <Widget>[
      Text("Exercise 1"),
      Container(
        padding: const EdgeInsets.only(top:560),
      ),
      FractionallySizedBox(
          widthFactor: 0.5,

          child: ElevatedButton(

            child: const Text('Next Exercise', style: const TextStyle(fontSize: 15)),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise2()));
            },
          )
      ),

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

class Exercise2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise1()));
                }),
    centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),

    body: Builder(
    builder: (context) =>
    ListView(
    children: <Widget>[
      Text("Exercise 2"),
      Container(
        padding: const EdgeInsets.only(top:560),
      ),
      FractionallySizedBox(
          widthFactor: 0.5,
          child: ElevatedButton(

            child: const Text('Next Exercise', style: const TextStyle(fontSize: 15)),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise3()));
            },
          )
      ),
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

class Exercise3 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise2()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),

            body: Builder(
                builder: (context) =>
                    ListView(
                      children: <Widget>[
                        Text("Exercise 3"),
                        Container(
                          padding: const EdgeInsets.only(top:560),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(

                              child: const Text('Next Exercise', style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise4()));
                              },
                            )
                        ),

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


class Exercise4 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise3()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),
            body: Builder(
                builder: (context) =>
                    ListView(
                      children: <Widget>[
                        Text("Exercise 4"),
                        Container(
                          padding: const EdgeInsets.only(top:560),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(

                              child: const Text('Next Exercise', style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise5()));
                              },
                            )
                        ),

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

class Exercise5 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise4()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),
            body: Builder(
                builder: (context) =>
                    ListView(
                      children: <Widget>[
                        Text("Exercise 5"),
                        Container(
                          padding: const EdgeInsets.only(top:560),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(

                              child: const Text('Next Exercise', style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise6()));
                              },
                            )
                        ),

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

class Exercise6 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise5()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),
            body: Builder(
                builder: (context) =>
                    ListView(
                      children: <Widget>[
                        Text("Exercise 6"),
                        Container(
                          padding: const EdgeInsets.only(top:560),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(

                              child: const Text('Next Exercise', style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise7()));
                              },
                            )
                        ),

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

class Exercise7 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(leading:IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Exercise6()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),
            body: Builder(
                builder: (context) =>
                    ListView(
                      children: <Widget>[
                        Text("Exercise 7"),
                        Container(
                          padding: const EdgeInsets.only(top:560),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(

                              child: const Text('Finish', style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new Finish()));
                              },
                            )
                        ),

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

class Finish extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar( leading:IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                }),
                centerTitle: true, title: Image.asset('assets/images/whitelogo.png', width: 150, height: 300)),
            body: Builder(
                builder: (context) =>
                    ListView(
                      children: <Widget>[
                        Text("Congrats page or something?", style: TextStyle(fontSize:15)),

                        Container(
                          padding: const EdgeInsets.only(top:560),
                        ),

                        FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(

                              child: const Text('Back to Home Page', style: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                              },
                            )
                        ),

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