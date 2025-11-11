import 'package:flutter/material.dart';

class VotingCard extends StatelessWidget {
  final String value;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isIcon;

  const VotingCard({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onTap,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.9)
              : colorScheme.surfaceContainerHigh,
          borderRadius: isSelected
              ? BorderRadius.circular(32)
              : BorderRadius.circular(18),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 16,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: isIcon
              ? Icon(
                  _getIconData(value),
                  size: 36,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                )
              : Text(
                  value,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 36,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface,
                  ),
                ),
        ),
      ),
    );
  }

  IconData _getIconData(String value) {
    switch (value) {
      case '?':
        return Icons.help_outline;
      case '☕':
        return Icons.coffee;
      default:
        return Icons.help_outline;
    }
  }
}
