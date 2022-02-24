import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  String response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DELETE - HTTP Request'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () async {
              var myresponse = await myhttp
                  .delete(Uri.parse('https://reqres.in/api/users/3'));

              if (myresponse.statusCode == 204) {
                setState(() {
                  response = 'Berhasil menghapus data';
                });
              }
            },
            child: Text('DELETE'),
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
