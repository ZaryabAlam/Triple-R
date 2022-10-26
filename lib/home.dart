import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          Container(
            height: _h * 0.4,
            width: _w * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://i.ibb.co/vhg30nt/R-logo.png"),
                  fit: BoxFit.contain),
            ),
          ),
          Container(
            height: _h * 0.06,
            width: _w * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF02b55d)),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Lets begin"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, shadowColor: Colors.transparent),
            ),
          )
        ],
      ),
    );
  }
}
