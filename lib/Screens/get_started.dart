import 'package:flutter/material.dart';
import 'package:practice_application/assets.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, bottom: 40),
        color: const Color(0xff0DCBA8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Assets.logo_white),
                Container(
                  // color: Colors.blue,
                  child: Image.asset(
                    Assets.boy_image,
                  ),
                ),
              ],
            ),
            const Text(
              'Food',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'Tracking Ideas',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'Receipe Ideas',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
           
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 40),
                child: ElevatedButton(
                  onPressed: () {},
                  
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff002967),),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
