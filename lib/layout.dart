import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Layout extends StatelessWidget{
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 300,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6F0FA),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff000000)
                        )
                      ),
                      child: const Center(child: Text("Strawberry Pavlova")),
                    ),
                    const SizedBox(height: 11,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6F0FA),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff000000)
                        )
                      ),
                      child: const Text("Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova. Pavlova featues a crisp crust and soft, light inside, topped with fruit and whipped cream.", textAlign: TextAlign.center,),
                    ),
                    const SizedBox(height: 11,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6F0FA),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff000000)
                        )
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, size: 14,),
                              Icon(Icons.star, size: 14,),
                              Icon(Icons.star, size: 14,),
                              Icon(Icons.star, size: 14,),
                              Icon(Icons.star, size: 14,),
                            ],
                          ),
                          Text('170 Reviews')
                        ],
                      )
                    ),
                    const SizedBox(height: 11,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6F0FA),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff000000)
                        )
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.kitchen_outlined, size: 16, color: Colors.green,),
                              Text("Prep"),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text("25 min"),
                              )
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Icon(Icons.timer_outlined, size: 16 , color: Colors.green,),
                              Text("COOK:"),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text("1 hr"),
                              )
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Icon(Icons.restaurant, size: 16, color: Colors.green,),
                              Text("FEEDS:"),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text("4-6"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Image.asset('images/image.png', height: double.infinity, fit: BoxFit.cover, width: 800,)
          ],
        ),
    );
  }
}