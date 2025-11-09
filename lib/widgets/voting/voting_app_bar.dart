import 'package:flutter/material.dart';

class VotingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onClosePressed;
  final VoidCallback? onAddPressed;

  const VotingAppBar({
    super.key,
    required this.title,
    this.onClosePressed,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: onClosePressed ?? () => Navigator.of(context).pop(),
        iconSize: 24,
      ),
      title: Text(title),
      actions: [
        if (onAddPressed != null)
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
            iconSize: 24,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
