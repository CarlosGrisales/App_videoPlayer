import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {

  Responsive({
    required this.width,
    required this.heigth,
    required this.diagonal,
    required this.isTablet,
  });

  final double width;
  final double heigth;
  final double diagonal;
  final bool isTablet;

  factory Responsive.fromContext(BuildContext context){
    final size = MediaQuery.sizeOf(context);
    return Responsive(
      width: size.width,
      heigth: size.height,
      diagonal: math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2)),
      isTablet: size.shortestSide >= 600,
    );
  }

  double wp(double percent) => width  * percent / 100;
  double hp(double percent) => heigth  * percent / 100;
  double dp(double percent) => diagonal  * percent / 100;
}
