import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybills_app/component/colors.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/paymentbackground.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 85, left: 45, right: 45),
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/success.png'),
                        fit: BoxFit.fill)),
              ),
              const Text(
                'test',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Text(
                'test',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 85, left: 45, right: 45),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black26),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Container(
                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(90)),
                          child:const Icon(
                            Icons.done,
                            color: Colors.white,size: 40,
                          ),
                        ),
                      const  Column(
                          children: [
                            Text(
                              'data',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      const  Text(
                          '\$999.999',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                                  Container(
                    margin: const EdgeInsets.only(top: 10,left: 45, right: 45),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black26),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(90)),
                          child:const Icon(
                            Icons.done,
                            color: Colors.white,size: 40,
                          ),
                        ),
                      const  Column(
                          children: [
                            Text(
                              'data',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      const  Text(
                          '\$999.999',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Text(
                'Total Amount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '\$999.999',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColor.mainColor,border: Border.all(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(90)),
                    child: IconButton(onPressed: () {}, icon:const Icon(Icons.share,size: 50,color:Colors.white,))),
                  Container(
                    decoration: BoxDecoration(color: AppColor.mainColor,border: Border.all(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(90)),
                    child: IconButton(onPressed: () {}, icon:const Icon(Icons.print,size: 50,color:Colors.white))),
                ],
              ),
             const SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:const EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),border: Border.all(width: 1,color: Colors.black)),
                child: MaterialButton(onPressed: (){
                  Get.back();
                },child:const Text("Done",style: TextStyle(fontSize: 35),),))
            ],
          ),
        ),
      ),
    );
  }
}
