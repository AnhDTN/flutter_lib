import 'package:flutter/material.dart';
import 'package:flutter_lib/animations/fade_animation.dart';
import 'package:flutter_lib/extensions/ui.dart';
import 'package:flutter_lib/resources/image_name.dart';
import 'package:flutter_lib/resources/route.dart';
import 'package:flutter_lib/views/router/routing.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Routing.navigateAnim(context, const LoginPage(),
                  routeName: RouteName.loginPage, replace: true);
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: SizedBox(
        height: maxHeight(context),
        width: maxWidth(context),
        child: Stack(children: [
          Positioned(
            top: -50,
            left: 0,
            child: FadeAnimation(
                delay: 1,
                child: Container(
                  width: maxWidth(context),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageName.splash),
                          fit: BoxFit.cover)),
                )),
          ),
          Positioned(
            top: -100,
            left: 0,
            child: FadeAnimation(
                delay: 1.3,
                child: Container(
                  width: maxWidth(context),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageName.splash),
                          fit: BoxFit.cover)),
                )),
          ),
          Positioned(
            top: -150,
            left: 0,
            child: FadeAnimation(
                delay: 1.6,
                child: Container(
                  width: maxWidth(context),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageName.splash),
                          fit: BoxFit.cover)),
                )),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const FadeAnimation(
                    delay: 1,
                    child: Text(
                      "Welcome",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    )),
                const SizedBox(
                  height: 15,
                ),
                FadeAnimation(
                    delay: 1.3,
                    child: Text(
                      "We promis that you'll have the most \nfuss-free time with us ever.",
                      style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.4,
                          fontSize: 20),
                    )),
                const SizedBox(
                  height: 180,
                ),
                FadeAnimation(
                    delay: 1.6,
                    child: AnimatedBuilder(
                      animation: _scaleController,
                      builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController,
                              builder: (context, child) => Container(
                                width: _widthAnimation.value,
                                height: 80,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue.withOpacity(.4)),
                                child: Stack(children: <Widget>[
                                  AnimatedBuilder(
                                    animation: _positionController,
                                    builder: (context, child) => Positioned(
                                      left: _positionAnimation.value,
                                      child: AnimatedBuilder(
                                        animation: _scale2Controller,
                                        builder: (context, child) =>
                                            Transform.scale(
                                          scale: _scale2Animation.value,
                                          child: InkWell(
                                              customBorder:
                                                  const CircleBorder(),
                                              onTap: () {
                                                _scaleController.forward();
                                              },
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blue),
                                                child: hideIcon == false
                                                    ? const Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      )
                                                    : Container(),
                                              )),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          )),
                    )),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
