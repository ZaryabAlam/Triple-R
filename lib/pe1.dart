import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    Color color,
    String urlImage,
    String title,
    Color colort,
    String subtitle,
  }) =>
      Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(urlImage), fit: BoxFit.contain)),
              ),
              const SizedBox(height: 64),
              Text(
                title,
                style: TextStyle(
                    color: colort, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(subtitle))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    BottomSheetThemeData(backgroundColor: Colors.black54);
    return Scaffold(
      body: Container(
//////////////////////// Screens ////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 3;
            });
          },
          children: [
            buildPage(
                color: Color(0xFFd7fada),
                urlImage: 'https://i.ibb.co/tCWk6Hn/r1.png',
                title: "REDUCE",
                subtitle:
                    'Reduce the amount of materials and goods you consume.'),
            buildPage(
                color: Color(0xFFd7fada),
                urlImage: 'https://i.ibb.co/Cw1LvCy/r2.png',
                title: "REUSE",
                subtitle:
                    'Reuse items as much as you can before replacing them.'),
            buildPage(
                color: Color(0xFFd7fada),
                urlImage: 'https://i.ibb.co/NC38Vmj/r3.png',
                title: "RECYCLE",
                subtitle: 'Recycle items wherever possible.'),
            buildPage(
                color: Color(0xFF00964c),
                urlImage: 'https://i.ibb.co/WPrjkny/r4.png',
                title: "Happy World",
                colort: Colors.white,
                subtitle: 'All these efforts for our Happier World.'),
          ],
        ),
      ),
/////////////////////////Bottom Sheet////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
      ///

      bottomSheet: isLastPage
          ? Stack(
              children: [
                Container(
                    height: 80,
                    decoration: BoxDecoration(color: Color(0xFF00964c))),
                TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size.fromHeight(80)),
                  onPressed: () async {},
                  child: Text("Get Started", style: TextStyle(fontSize: 20)),
                ),
              ],
            )
          : Stack(
              children: [
                Container(
                    height: 80,
                    decoration: BoxDecoration(color: Color(0xFFd7fada))),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80)),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => controller.jumpToPage(3),
                          child: Text("Skip")),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 4,
                          effect: SwapEffect(
                              dotColor: Colors.green[200],
                              activeDotColor: Color(0xFF02b55d)),
                          onDotClicked: (index) => controller.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                        ),
                      ),
                      TextButton(
                          onPressed: () => controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                          child: Text("Next"))
                    ],
                  ),
                ),
              ],
            ),
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
    );
  }
}
