import 'dart:ui';

import 'package:flutter/material.dart';

class AlreadyVotedContainer extends StatelessWidget {
  final int votedCount;
  final int totalCount;
  final List<Widget> avatars;
  final VoidCallback? onRevealPressed;
  final bool canReveal;

  const AlreadyVotedContainer({
    super.key,
    required this.votedCount,
    required this.totalCount,
    required this.avatars,
    this.onRevealPressed,
    this.canReveal = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$votedCount/$totalCount Voted',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: avatars,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: canReveal ? onRevealPressed : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canReveal
                          ? colorScheme.primary
                          : colorScheme.primary.withValues(alpha: 0.3),
                      foregroundColor: canReveal
                          ? colorScheme.onPrimary
                          : colorScheme.onPrimary.withValues(alpha: 0.5),
                      disabledBackgroundColor: colorScheme.primary.withValues(
                        alpha: 0.3,
                      ),
                      disabledForegroundColor: colorScheme.onPrimary.withValues(
                        alpha: 0.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'Reveal Votes',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: canReveal
                            ? colorScheme.onPrimary
                            : colorScheme.onPrimary.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
