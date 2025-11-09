import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:veloci/routing/route_names.dart';
import 'package:veloci/screens/add_task_screen.dart';
import 'package:veloci/screens/create_session_screen.dart';
import 'package:veloci/screens/dashboard_screen.dart';
import 'package:veloci/screens/voting_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.dashboard,
    routes: [
      GoRoute(
        path: RouteNames.dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),

      GoRoute(
        path: RouteNames.createSession,
        builder: (context, state) => const CreateSessionScreen(),
      ),

      GoRoute(
        path: RouteNames.addTask,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;
          final sessionName =
              data?['sessionName'] as String? ?? 'Untitled Session';
          final sessionDescription =
              data?['sessionDescription'] as String? ?? '';

          return AddTaskScreen(
            sessionName: sessionName,
            sessionDescription: sessionDescription,
          );
        },
      ),

      GoRoute(
        path: RouteNames.voting,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>?;

          final taskTitle = data?['taskTitle'] as String? ?? 'User Story #123';
          final taskDescription =
              data?['taskDescription'] as String? ??
              'As a user, I want to be able to estimate story points using Planning Poker so that the team can agree on task complexity.';
          final sessionName =
              data?['sessionName'] as String? ?? 'Sprint Planning';

          return VotingScreen(
            taskTitle: taskTitle,
            taskDescription: taskDescription,
            sessionName: sessionName,
          );
        },
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              '404 - Page Not Found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'The page "${state.uri}" does not exist.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.dashboard),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    ),
  );
}
