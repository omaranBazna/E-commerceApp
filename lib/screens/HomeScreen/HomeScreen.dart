import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String val = "test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("REST API"),
      ),
      body: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: val,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  void fetchUsers() async {
    print("fetch users");
    print("fetched");
    final uri = Uri.parse("https://bendapi.omranbazna.repl.co/");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final obj = jsonDecode(body);
        setState(() {
          val = obj['val'];
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during HTTP request: $error");
    }
  }
}
