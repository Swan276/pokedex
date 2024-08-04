import 'package:flutter/material.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/utils/themes/ui_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.id,
    required this.routeTo,
  });

  final String? id;
  final void Function(String? id) routeTo;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      widget.routeTo(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Assets.animations.pokeballLoading.lottie(
            height: 160,
            width: 160,
          ),
        ),
      ),
    );
  }
}
