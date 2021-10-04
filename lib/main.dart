import 'package:flutter/material.dart';
import 'package:splash_screen_gofoodman_app/screens/fooditems.dart';
import 'package:splash_screen_gofoodman_app/screens/text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Size _size = MediaQuery.of(context).size;
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
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

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

    // ----- ------------- -------  //

    _Imagecurve = CurvedAnimation(
        parent: _animationController as Animation<double>,
        curve: Curves.decelerate);

    _animationImageUp = Tween(
      begin: 0.0,
      end: 22.0,
    ).animate(_Imagecurve!);

    _animationLogoCurve = CurvedAnimation(
        parent: _animationController as Animation<double>,
        curve: Curves.easeIn);

    _animationLogo = Tween(
      begin: 22.0,
      end: 1.0,
    ).animate(_animationLogoCurve as Animation<double>);

    // _Containercurve = CurvedAnimation(
    //     parent: _animationController as Animation<double>,
    //     curve: Curves.decelerate);

    // _animationContainerSqueeze = Tween<double>(
    //   begin: 20.0,
    //   end: 30.0,
    // ).animate(_Containercurve as Animation<double>);

    // _animationLogoIn = Tween(
    //   begin: 5.0,
    //   end: 1.0,
    // ).animate(CurvedAnimation(
    //     parent: _animationController as Animation<double>,
    //     curve: const Interval(0.7, 1.0, curve: Curves.decelerate)));

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
    Color myHexColor = const Color(0xFF00CF7BA);
    Size _size = MediaQuery.of(context).size;
    var _myWidth = MediaQuery.of(context).size.width;
    var _myHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        _animationController!.forward(from: 0.0);
        setState(() {
          _myWidth = MediaQuery.of(context).size.width / 2;
          _myHeight = MediaQuery.of(context).size.height / 2;
        });
      },
      child: AnimatedBuilder(
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
                      top: _size.height / 5.5,
                      left: _size.width / 2.7,
                      child: FadeTransition(
                        opacity: _animationLogo as Animation<double>,
                        child: Container(
                          height: _size.height / 2,
                          width: _size.width / 3.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/logo.gif"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: _size.height / 1.9,
                      left: _size.width / 5,
                      child: TextScreen(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
