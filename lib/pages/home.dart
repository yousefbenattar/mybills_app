import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white24,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
          ],
        ),
      ),
    );
  }

  Widget _headSection() {
    return Container(
      height: 311,
      color: Colors.green,
      child: Stack(children: [
        Positioned(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover)),
        )),
        Positioned(
            bottom: 0,
            left: 0,
            right: -20,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/curve.png'),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            bottom: 0,
            right: 33,
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/lines.png'),
                        fit: BoxFit.cover)),
              ),
            ))
      ]),
    );
  }
}
