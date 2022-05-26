import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Request Sample"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    const SnackBar(content: Text("Http Get"));
                    setState(() {
                      content = "Get";
                    });
                  },
                  child: const Text("Get")),
              ElevatedButton(
                  onPressed: () {
                    const SnackBar(
                      content: Text("Http Post"),
                    );
                    setState(() {
                      content = "Post";
                    });
                  },
                  child: const Text("Post"))
            ],
          ),
          Text(content)
        ],
      ),
    );
  }
}