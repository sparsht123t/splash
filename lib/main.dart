import 'package:flutter/material.dart';

import 'package:splash_screen_gofoodman_app/screens/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Modeco',
      ),
      home: InitialPage(),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationController? _textController;
  Animation<double>? text_fade;

  Animation<double>? _animationImageUp;
  Animation<double>? _Imagecurve;
  Animation<double>? _Containercurve;
  Animation<double>? _animationLogo;
  Animation<double>? _animationLogoCurve;

  @override
  void initState() {
    // ----- Animation COntroller -------  //
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // ----------------------- ///

    _textController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _textController as Animation<double>,
      curve: const Interval(0.0, 1.0, curve: Curves.decelerate),
    );

    text_fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    // -------------------//

    _Imagecurve = CurvedAnimation(
        parent: _animationController as Animation<double>,
        curve: Curves.decelerate);

    _animationImageUp = Tween(
      begin: 0.0,
      end: 22.0,
    ).animate(_Imagecurve!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _textController!.forward();
        }
      });

    _animationLogoCurve = CurvedAnimation(
        parent: _animationController as Animation<double>,
        curve: Curves.easeIn);

    _animationLogo = Tween(
      begin: 22.0,
      end: 1.0,
    ).animate(_animationLogoCurve as Animation<double>);


    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color myHexColor = const Color(0xff00cf7ba);
    Size _size = MediaQuery.of(context).size;
    // var _myWidth = MediaQuery.of(context).size.width;
    // var _myHeight = MediaQuery.of(context).size.height;
    return
        AnimatedBuilder(
      animation: _animationController as Listenable,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: Container(
              color: myHexColor,
              child: Stack(
                children: [
                  Positioned(
                    top: _size.height / 3,
                    left: 10,
                    child: Transform.translate(
                      offset:
                          Offset(0.0, 10 * (1.0 - _animationImageUp!.value)),
                      child: Image.asset('assets/pizza-75.png'),
                    ),
                  ),

                  Positioned(
                    top: _size.height / 1.6,
                    left: 0.1,
                    child: Transform.translate(
                      offset:
                          Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
                      child: Image.asset('assets/popcorn-75.png'),
                    ),
                  ),
                  // top right
                  Positioned(
                    top: _size.height / 2.5,
                    left: _size.width / 1.5,
                    child: Transform.translate(
                      offset:
                          Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
                      child: Image.asset('assets/sandwich-75.png'),
                    ),
                  ),
                  Positioned(
                    top: _size.height / 1.1,
                    left: _size.width / 1.5,
                    child: Transform.translate(
                      offset:
                          Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
                      child: Image.asset('assets/burger-75.png'),
                    ),
                  ),
                  Positioned(
                    top: _size.height / 0.9,
                    left: _size.width / 6.1,
                    child: Transform.translate(
                      offset:
                          Offset(10.0, 10 * (1.0 - _animationImageUp!.value)),
                      child: Image.asset('assets/french-fries-75.png'),
                    ),
                  ),
                  Positioned(
                    top: _size.height / 2.5,
                    left: _size.width / 2.6,
                    child: Container(
                      height: _size.height / 9,
                  
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                     
                      child: Container(
                        margin: EdgeInsets.all(1.8),
                        child: ClipRRect(
                         
                          borderRadius: BorderRadius.circular(11.0),
                        
                          child: Image.asset(
                            "assets/logo.gif",
                          ),
                        ),

                        
                      ),
                    ),
                  ),
                  //
                  Positioned(
                    top: _size.height / 1.9,
                    left: _size.width / 5,
                    child: Opacity(
                        opacity: text_fade!.value, child: const TextScreen()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
