import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
      _animationController=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    super.initState();
  }
  bool currentPlaying=false;
  void _iconTapped() {
    if (currentPlaying == false) {
      currentPlaying = true;
      _animationController.forward();
    } else {
      currentPlaying = false;
      _animationController.reverse();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _iconTapped,
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
            size: 200,

          ),
        ),
      ),
    );
  }
}
