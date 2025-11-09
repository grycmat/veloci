import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:veloci/routing/route_names.dart';
import 'package:veloci/widgets/voting/voting_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _startNewSession(BuildContext context) {
    context.go(RouteNames.createSession);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.casino_outlined,
                  size: 80,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 24),

                Text(
                  'Veloci',
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Scrum Poker',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 48),

                VotingButton(
                  text: 'Start New Session',
                  onPressed: () => _startNewSession(context),
                  icon: Icons.play_arrow,
                  width: 280,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
