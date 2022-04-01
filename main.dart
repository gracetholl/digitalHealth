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
      title: _title,
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
            appBar: AppBar(title: const Text(""), centerTitle: true),
            body: Builder(
              builder: (context) =>
              ListView(
            children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Theme.of(context).backgroundColor,
                    child: const Text(
                      'Post Hip Surgery Exercises',
                    style: TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Colors.red)),
                  ),
                Container(
                  padding:const EdgeInsets.all(10),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                      '1. Hip Extensions',
                      style: TextStyle(fontSize:20, fontWeight: FontWeight.normal)),
                ),
              Container(
                padding: const EdgeInsets.all(40),
              ),
              Image.asset('assets/images/hipextension.gif', height:300, width: 100),

           ])

        )));
  }

}



