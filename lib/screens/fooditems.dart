import 'package:flutter/material.dart';

class FoodItems extends StatelessWidget {
  final top;
  final left;
  final String imgUrl;
  final animationImageUp;

  FoodItems({
    required this.top,
    required this.left,
    required this.imgUrl,
    required this.animationImageUp,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.translate(
        offset: Offset(10.0, 10 * (1.0 - animationImageUp!.value)),
        child: Image.asset('assets/popcorn.png'),
      ),
    );
  }
}



//  Positioned(
//                     top: _size.height / 1.6,
//                     left: 100,
//                     child: Transform.translate(
//                       offset:
//                           Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
//                       child: Image.asset('assets/popcorn.png'),
//                     ),
//                   ),
//                   // top right
//                   Positioned(
//                     top: _size.height / 2.5,
//                     left: _size.width / 1.5,
//                     child: Transform.translate(
//                       offset:
//                           Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
//                       child: Image.asset('assets/sandwich.png'),
//                     ),
//                   ),
//                   Positioned(
//                     top: _size.height / 1.1,
//                     left: _size.width / 1.5,
//                     child: Transform.translate(
//                       offset:
//                           Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
//                       child: Image.asset('assets/burger.png'),
//                     ),
//                   ),
//                   Positioned(
//                     top: _size.height / 5.1,
//                     left: _size.width / 1.5,
//                     child: Transform.translate(
//                       offset:
//                           Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
//                       child: Image.asset('assets/frenchfries.png'),
//                     ),
//                   ),
             