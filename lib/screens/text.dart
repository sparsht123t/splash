import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Row(children: const [
        Text(
          "GO",
          style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Modeco',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          " FOOD",
          style: TextStyle(
              fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          " MAN",
          style: TextStyle(
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ]),
      tween: Tween<double>(
          begin: 0,
          end:
              1), // value 0,0,1,0.2 etc , range 0 to 1 divide by seconds , all the value inside that
      duration: const Duration(milliseconds: 4200),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}
