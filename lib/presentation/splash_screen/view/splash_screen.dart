import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zappio/core/constants/colors.dart';
import 'package:zappio/core/constants/text_styles.dart';
import 'package:zappio/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _letterControllers;
  late List<Animation<double>> _fadeAnimations;
  final String title = "ZAPPIO";

  @override
  void initState() {
    super.initState();

    _letterControllers = List.generate(title.length, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      );
    });

    _fadeAnimations = _letterControllers.map((controller) {
      return CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    }).toList();

    _playStaggeredAnimation();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(),
        ),
      );
    });
  }

  void _playStaggeredAnimation() async {
    for (int i = 0; i < _letterControllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      _letterControllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _letterControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(title.length, (index) {
                return FadeTransition(
                  opacity: _fadeAnimations[index],
                  child: SlideTransition(
                    position: _fadeAnimations[index].drive(
                      Tween<Offset>(
                        begin: const Offset(0, -0.5),
                        end: Offset.zero,
                      ),
                    ),
                    child: Text(
                      title[index],
                      style: GLTextStyles.appNameStyle(context),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.h),
            FadeTransition(
              opacity: _fadeAnimations.last,
              child: Text(
                "Let's begin ride",
                style: GLTextStyles.subAppNameStyle(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
