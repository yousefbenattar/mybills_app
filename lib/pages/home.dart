import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybills_app/pages/payment_page.dart';
import '../controllers/data_controllers.dart';
import '/component/colors.dart'; // Import your colors file
  String baseUrl = 'http://127.0.0.1:8000/uploads/';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Datacontroller _datacontroller = Get.put(Datacontroller());
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
            _headSection(),
            Obx(() {
              if (_datacontroller.Loading == false) {
                return const Center(
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator()));
              } else {
                return _listView();
              }
            }),
            _btn()
          ],
        ),
      ),
    );
  }

  Widget _headSection() {
    return Positioned(
      top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
        child: Stack(children: [
          Positioned(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: -20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/curve.png'), fit: BoxFit.cover)),
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
                        return SizedBox(
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
                                  child: SingleChildScrollView(
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
                                  ),
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
                          image: AssetImage('assets/lines.png'),
                          fit: BoxFit.cover)),
                ),
              )),
        const  Positioned(
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
        ]),
      ),
    );
  }

  Widget _listView() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.34,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.58,
                  
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: ListView.builder(
              itemCount: _datacontroller.list.length,
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
                                            color: const Color.fromARGB(255, 255, 174, 0), width: 3),
                                        image:  DecorationImage(
                                            image: NetworkImage(baseUrl+_datacontroller.list[index].brand_logo),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                   Column(
                                    children: [
                                      Text(
                                        _datacontroller.list[index].brand_name,
                                        style:
                                            const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                       Text(_datacontroller.list[index].id.toString())
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                 if(_datacontroller.list[index].status==0){
                                  _datacontroller.list[index].status=1;
                                 }
                                 else if (_datacontroller.list[index].status==1){
                                  _datacontroller.list[index].status=0;
                                 }
                                print(_datacontroller.list[index].status);
                                  _datacontroller.list.refresh();
                                  print(_datacontroller.newlist.length);

                                },
                                child: Container(
                                    padding:const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: _datacontroller.list[index].status == 0 ?
                                        AppColor.backGroundColor : Colors.green ,
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.halfOval)),
                                    child:  Text('Pay',
                                    style: TextStyle(color:_datacontroller.list[index].status== 0 ?
                                     Colors.grey :Colors.white ),)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _datacontroller.list[index].due_info,
                                style: TextStyle(
                                  color: AppColor.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(_datacontroller.list[index].due.toString(),
                                      style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontWeight: FontWeight.bold)),
                                  Text('Pay ${_datacontroller.list[index].due}',
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
        ),
      ),
    );
  }

  Widget _btn() {
    return Positioned(
        height: MediaQuery.of(context).size.height * 0.07,
        bottom: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: AppColor.mainColor,
            minWidth: MediaQuery.of(context).size.width - 20,
            onPressed: () {
              Get.to(() => const PaymentPage());
            },
            child: const Text(
              'Pay',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ));
  }

}
