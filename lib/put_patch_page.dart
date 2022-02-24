import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as myhttp;

class PutPatchPage extends StatefulWidget {
  const PutPatchPage({Key? key}) : super(key: key);

  @override
  _PutPatchPageState createState() => _PutPatchPageState();
}

class _PutPatchPageState extends State<PutPatchPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String response = 'Data kosong ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUT/PATCH - HTTP Request'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await myhttp.put(
                Uri.parse('https://reqres.in/api/users/3'),
                body: {"name": nameC.text, "job": jobC.text},
              );

              Map<String, dynamic> result =
                  json.decode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                response = "${result['name']} - ${result['job']}";
              });
            },
            child: Text('SUBMIT'),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Text(response),
        ],
      ),
    );
  }
}
