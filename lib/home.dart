import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripler/main.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF02b55d),
          title: const Text("Triple R"),
          actions: [
            IconButton(
                icon: Icon(Icons.login_rounded),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Page1()));
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: _h * 0.4,
                width: _w * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage("https://i.ibb.co/vhg30nt/R-logo.png"),
                      fit: BoxFit.contain),
                ),
              ),
              Text(
                "More Coming Soon",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
