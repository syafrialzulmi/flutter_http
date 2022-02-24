import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

import './models/user.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  List<UserModel> allUser = [];

  Future getAllUser() async {
    // await Future.delayed(Duration(seconds: 3));
    try {
      var response = await myhttp.get(Uri.parse('https://reqres.in/api/users'));
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      data.forEach((element) {
        allUser.add(UserModel.fromJson(element));
        // allUser.add(UserModel(
        //   avatar: element["avatar"],
        //   first_name: element["first_name"],
        //   last_name: element["last_name"],
        //   email: element["email"],
        //   id: element["id"],
        // )
        // );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder - HTTP Request'),
      ),
      body: FutureBuilder(
          future: getAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('Loading Data'),
              );
            } else {
              return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(allUser[index].avatar),
                      ),
                      title: Text(
                          "${allUser[index].firstName} ${allUser[index].lastName}"),
                      subtitle: Text(allUser[index].email),
                    );
                  }));
            }
          }),
    );
  }
}
