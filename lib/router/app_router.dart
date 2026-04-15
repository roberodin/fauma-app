import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fauma_app/widgets/bottom_nav.dart';

// Splash / Onboarding / Auth
import 'package:fauma_app/screens/splash/splash_screen.dart';
import 'package:fauma_app/screens/onboarding/onboarding_screen.dart';
import 'package:fauma_app/screens/auth/login_screen.dart';

// Tab screens
import 'package:fauma_app/screens/home/home_screen.dart';
import 'package:fauma_app/screens/explore/explore_screen.dart';
import 'package:fauma_app/screens/my_animals/my_animals_screen.dart';
import 'package:fauma_app/screens/profile/profile_screen.dart';

// Explore sub-routes
import 'package:fauma_app/screens/explore/species_detail_screen.dart';
import 'package:fauma_app/screens/explore/species_subscriber_screen.dart';
import 'package:fauma_app/screens/explore/project_detail_screen.dart';
import 'package:fauma_app/screens/explore/project_subscriber_screen.dart';

// Conversion flow
import 'package:fauma_app/screens/conversion/level_selection_screen.dart';
import 'package:fauma_app/screens/conversion/shipping_screen.dart';
import 'package:fauma_app/screens/conversion/gift_screen.dart';
import 'package:fauma_app/screens/conversion/payment_screen.dart';
import 'package:fauma_app/screens/conversion/success_screen.dart';

// My Animals sub-routes
import 'package:fauma_app/screens/my_animals/animal_detail_screen.dart';
import 'package:fauma_app/screens/my_animals/animal_gallery_screen.dart';
import 'package:fauma_app/screens/my_animals/curiosities_screen.dart';
import 'package:fauma_app/screens/my_animals/health_diary_screen.dart';

// My Project sub-routes
import 'package:fauma_app/screens/my_project/my_project_screen.dart';
import 'package:fauma_app/screens/my_project/deep_dive_screen.dart';
import 'package:fauma_app/screens/my_project/team_screen.dart';
import 'package:fauma_app/screens/my_project/results_screen.dart';
import 'package:fauma_app/screens/my_project/project_gallery_screen.dart';

// Navigator keys for ShellRoute
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    // ── Splash ──────────────────────────────────────────────
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),

    // ── Onboarding ──────────────────────────────────────────
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // ── Login ───────────────────────────────────────────────
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // ── Main app shell with bottom navigation ───────────────
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithBottomNav(child: child);
      },
      routes: [
        // Tab 0 — Home
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),

        // Tab 1 — Explore
        GoRoute(
          path: '/explore',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ExploreScreen(),
          ),
          routes: [
            // Public presentation (pre-subscription)
            GoRoute(
              path: 'species/:id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => SpeciesDetailScreen(
                id: state.pathParameters['id']!,
              ),
            ),
            // Subscriber view with botonera (post-subscription)
            GoRoute(
              path: 'species/:id/subscriber',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => SpeciesSubscriberScreen(
                id: state.pathParameters['id']!,
              ),
            ),
            // Public presentation (pre-subscription)
            GoRoute(
              path: 'project/:id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => ProjectDetailScreen(
                id: state.pathParameters['id']!,
              ),
            ),
            // Subscriber view with botonera (post-subscription)
            GoRoute(
              path: 'project/:id/subscriber',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => ProjectSubscriberScreen(
                id: state.pathParameters['id']!,
              ),
            ),
          ],
        ),

        // Tab 2 — My Animals
        GoRoute(
          path: '/my-animals',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MyAnimalsScreen(),
          ),
          routes: [
            GoRoute(
              path: ':id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => AnimalDetailScreen(
                id: state.pathParameters['id']!,
              ),
              routes: [
                GoRoute(
                  path: 'gallery',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => AnimalGalleryScreen(
                    animalId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: 'curiosities',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => CuriositiesScreen(
                    animalId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: 'health',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => HealthDiaryScreen(
                    animalId: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Tab 3 — Profile
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
        ),
      ],
    ),

    // ── Conversion flow (outside shell — full screen) ───────
    GoRoute(
      path: '/conversion/level/:id',
      builder: (context, state) => LevelSelectionScreen(
        id: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/conversion/shipping',
      builder: (context, state) => const ShippingScreen(),
    ),
    GoRoute(
      path: '/conversion/gift',
      builder: (context, state) => const GiftScreen(),
    ),
    GoRoute(
      path: '/conversion/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/conversion/success',
      builder: (context, state) => const SuccessScreen(),
    ),

    // ── My Project (outside shell — full screen) ────────────
    GoRoute(
      path: '/my-project/:id',
      builder: (context, state) => MyProjectScreen(
        id: state.pathParameters['id']!,
      ),
      routes: [
        GoRoute(
          path: 'deep-dive',
          builder: (context, state) => DeepDiveScreen(
            projectId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: 'team',
          builder: (context, state) => TeamScreen(
            projectId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: 'results',
          builder: (context, state) => ResultsScreen(
            projectId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: 'gallery',
          builder: (context, state) => ProjectGalleryScreen(
            projectId: state.pathParameters['id']!,
          ),
        ),
      ],
    ),
  ],
);
