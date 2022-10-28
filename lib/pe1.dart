import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    Color color,
    String urlImage,
    String title,
    String subtitle,
  }) =>
      Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(urlImage, fit: BoxFit.contain),
              const SizedBox(height: 64),
              Text(
                title,
                style: TextStyle(
                    color: Colors.teal.shade700,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
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

    return Scaffold(
      body: Container(
//////////////////////// Screens ////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
        padding: const EdgeInsets.only(bottom: 70),
        child: PageView(
          controller: controller,
          children: [
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/r1.png',
                title: "REDUCE",
                subtitle: 'subtitle'),
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/r2.png',
                title: "REUSE",
                subtitle: 'subtitle'),
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/r3.png',
                title: "RECYCLE",
                subtitle: 'subtitle'),
          ],
        ),
      ),
/////////////////////////Bottom Sheet////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => controller.jumpToPage(2), child: Text("Skip")),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: SwapEffect(
                    dotColor: Colors.green[200],
                    activeDotColor: Color(0xFF02b55d)),
                onDotClicked: (index) => controller.animateToPage(index,
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
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
    );
  }
}
