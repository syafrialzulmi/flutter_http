import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/delete_page.dart';
import 'package:flutter_http/future_builder.dart';
import 'package:flutter_http/get_page.dart';
import 'package:flutter_http/post_page.dart';
import 'package:flutter_http/put_patch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilderPage(),
    );
  }
}
