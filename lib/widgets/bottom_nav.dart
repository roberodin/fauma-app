import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNav extends StatelessWidget {
  const ScaffoldWithBottomNav({super.key, required this.child});

  final Widget child;

  static const _tabs = [
    '/home',
    '/explore',
    '/my-animals',
    '/profile',
  ];

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    for (int i = 0; i < _tabs.length; i++) {
      if (location.startsWith(_tabs[i])) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        backgroundColor: theme.colorScheme.surface,
        indicatorColor: theme.colorScheme.primary.withValues(alpha: 0.12),
        onDestinationSelected: (index) {
          if (index != currentIndex) {
            context.go(_tabs[index]);
          }
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: theme.colorScheme.primary,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.explore_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.explore,
              color: theme.colorScheme.primary,
            ),
            label: 'Explorar',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.pets_outlined,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.pets,
              color: theme.colorScheme.primary,
            ),
            label: 'Mis Animales',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: theme.colorScheme.primary,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
