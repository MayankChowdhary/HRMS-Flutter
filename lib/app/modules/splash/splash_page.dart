import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/storage_utils.dart';
import '../../data/api/api_path.dart';
import '../../routes/routes.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  ///initialise
  ///
  @override
  void initState() {
    super.initState();

    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    Timer(
        const Duration(milliseconds: 3500),
            () => Get.offNamed(StorageUtils.instance.isLoggedIn()
            ? Routes.getNavigationPage()
            : Routes.getLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Center(
              child: Image.asset(
                APIPath.kAssetLogo,
                width: Dimensions.splashImageHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}

