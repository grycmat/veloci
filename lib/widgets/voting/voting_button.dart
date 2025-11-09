import 'package:flutter/material.dart';

enum VotingButtonStyle { primary, secondary, disabled }

class VotingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final VotingButtonStyle style;
  final double? width;
  final double height;
  final IconData? icon;

  const VotingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style = VotingButtonStyle.primary,
    this.width,
    this.height = 56,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Color backgroundColor;
    Color foregroundColor;
    Color? borderColor;

    switch (style) {
      case VotingButtonStyle.primary:
        backgroundColor = colorScheme.primary;
        foregroundColor = colorScheme.onPrimary;
        borderColor = null;
        break;
      case VotingButtonStyle.secondary:
        backgroundColor = colorScheme.surfaceContainerHighest;
        foregroundColor = colorScheme.onSurface;
        borderColor = colorScheme.outline;
        break;
      case VotingButtonStyle.disabled:
        backgroundColor = colorScheme.primary.withOpacity(0.3);
        foregroundColor = colorScheme.onPrimary.withOpacity(0.5);
        borderColor = null;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: style == VotingButtonStyle.disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: backgroundColor,
          disabledForegroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 1)
                : BorderSide.none,
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: foregroundColor),
                  ),
                ],
              )
            : Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: foregroundColor),
              ),
      ),
    );
  }
}
