import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/pantallaLoad.json',
          width: 220,
          height: 220,
          fit: BoxFit.fill),
          
        ],
      ),
    );
  }
}