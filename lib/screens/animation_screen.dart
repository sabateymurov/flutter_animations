import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> animation;

  final Tween<double> opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  void initState() {
    print('init state');

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    animation = opacityTween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.yellow.withOpacity(animation.value),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  if (animation.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: Text('Animate'))
          ],
        ),
      ),
    );
  }
}
