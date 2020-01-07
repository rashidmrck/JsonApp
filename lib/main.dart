import 'dart:convert';

import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
    title: "jason App",
    theme: ThemeData(primarySwatch: Colors.amber),
    home: Json()));

class Json extends StatefulWidget {
  @override
  _JsonState createState() => _JsonState();
}

class _JsonState extends State<Json> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json App"),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("load_json/person.json"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var mydata = jsonDecode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Name : " + mydata[index]['name']),
                      Text("Age : " + mydata[index]['age']),
                      Text("Gender : " + mydata[index]['gender']),
                    ],
                  ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
            );
          },
        ),
      ),
    );
  }
}
