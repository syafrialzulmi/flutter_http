import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  late String id;
  late String email;
  late String name;
  @override
  void initState() {
    id = '';
    email = '';
    name = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Request'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID : $id'),
            Text('NAME : $name'),
            Text('EMAIL : $email'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var myresponse = await myhttp
                    .get(Uri.parse('https://reqres.in/api/users/2'));
                if (myresponse.statusCode == 200) {
                  Map<String, dynamic> result =
                      jsonDecode(myresponse.body) as Map<String, dynamic>;
                  setState(() {
                    id = result['data']['id'].toString();
                    email = result['data']['email'].toString();
                    name = "${result['data']['first_name']}"
                        "${result['data']['last_name']}";
                  });
                } else {
                  setState(() {
                    print('Error ${myresponse.statusCode}');
                  });
                }
              },
              child: Text('GET DATA'),
            ),
          ],
        ),
      ),
    );
  }
}
