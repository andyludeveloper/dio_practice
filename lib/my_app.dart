import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_request_practice/model/user.dart';
import 'package:http_request_practice/service/network.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var content = "";
  var isProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Request Sample"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      showProgress();
                      var data;
                      try {
                        data = await Network().get("posts/1");
                        final jsonObj = jsonDecode(data);
                        final user = User.fromJson(jsonObj);
                        print(user);
                      } on DioError catch (e) {
                        data = "No network: " + e.message;
                      }
                      stopProgress(data);
                    },
                    child: const Text("Get")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        content = "Post";
                      });
                    },
                    child: const Text("Post"))
              ],
            ),
            isProgress ? const CircularProgressIndicator() : Text(content)
          ],
        ),
      ),
    );
  }

  void stopProgress(String data) {
    setState(() {
      isProgress = false;
      content = data;
    });
  }

  void showProgress() {
    setState(() {
      isProgress = true;
      content = "";
    });
  }
}
