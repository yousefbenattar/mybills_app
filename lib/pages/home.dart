import 'package:flutter/material.dart';
import '/component/colors.dart'; // Import your colors file

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
      //backgroundColor: backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: h / 3,
                child: _headSection(),
              ),
            ),
            Positioned(
                top: h * 0.34,
                child: SizedBox(
                  height: h * 0.58,
                  child: _listView(),
                )),
            Positioned(
                height: h * 0.07,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: AppColor.mainColor,
                    minWidth: w - 20,
                    onPressed: () {},
                    child: const Text(
                      'Pay',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _headSection() {
    return Stack(children: [
      Positioned(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
      )),
      Positioned(
          bottom: 0,
          left: 0,
          right: -20,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/curve.png'), fit: BoxFit.cover)),
          )),
      Positioned(
          bottom: 0,
          right: 33,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext buildcontext) {
                    return Container(
                      height: MediaQuery.of(context).size.height -MediaQuery.of(context).size.height * 0.265,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: [
                        Positioned(
                            right: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(50)),
                              height: MediaQuery.of(context).size.height - 600,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.white,size: 50,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,size: 50,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.history,
                                      color: Colors.white,size: 50,
                                    )),
                              ]),
                            )),
                      ]),
                    );
                  });
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/lines.png'),
                      fit: BoxFit.cover)),
            ),
          )),
      Positioned(
          top: 50,
          left: 30,
          child: Text(
            "My Bill's",
            style: TextStyle(
              fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 44,
            ),
          ))
    ]);
  }

  Widget _listView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 122,
                decoration: BoxDecoration(
                  color: AppColor.backGroundColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(22),
                      bottomRight: Radius.circular(22)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.redAccent, width: 3),
                                    image: const DecorationImage(
                                        image: AssetImage('images/brand1.png'),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'test',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('test')
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Select'))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Auto pay on 24 may 2024',
                            style: TextStyle(
                              color: AppColor.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('\$999.999',
                                  style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.bold)),
                              Text('test test',
                                  style: TextStyle(color: AppColor.idColor))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
