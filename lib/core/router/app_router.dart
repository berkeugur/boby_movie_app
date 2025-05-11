import 'package:boby_movie_app/features/home/presentation/pages/home_page.dart';
import 'package:boby_movie_app/features/onboarding/presentation/pages/onboarding_genres_screen.dart';
import 'package:boby_movie_app/features/onboarding/presentation/pages/onboarding_movies_screen.dart';
import 'package:boby_movie_app/features/paywall/presentation/pages/paywall_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GetIt locator = GetIt.instance;

final GoRouter router = GoRouter(
  initialLocation: '/onboarding-movies',
  routes: [
    // Ana rota
    GoRoute(
      path: '/onboarding-movies',
      builder: (context, state) {
        return OnboardingMoviesScreen();
      },
    ),
    GoRoute(
      path: '/onboarding-genres',
      builder: (context, state) {
        return OnboardingGenresScreen();
      },
    ),

    GoRoute(
      path: '/paywall',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            fullscreenDialog: true,
            child: PaywallScreen(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
      builder: (context, state) {
        return PaywallScreen();
      },
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomePage();
      },
    ),
  ],
);
