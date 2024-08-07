import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation scaleAnimation;
  @override
  void initState() {
    super.initState();
    scaleAnimationInitialization();
    goToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: scaleAnimation,
          builder: (context, child) {
            return Container(
              height: double.parse((scaleAnimation.value).toString()),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImages.cinemaBackground),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedBuilder(
          animation: scaleAnimation,
          builder: (context, child) {
            return Text(
              "Shoof Film",
              style: GoogleFonts.pacifico(
                fontSize:
                    double.parse((scaleAnimation.value).toString()) / 6.25,
              ),
            );
          },
        )
      ],
    );
  }

  void goToHomeView() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        GoRouter.of(context).push(AppRoutes.homeView);
      },
    );
  }

  void scaleAnimationInitialization() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    scaleAnimation =
        IntTween(begin: 70, end: 170).animate(_animationController);
    _animationController.forward();
  }
}
