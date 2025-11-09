import 'package:flutter/material.dart';
import 'package:veloci/theme/colors.dart';

class VotesAvatar extends StatelessWidget {
  final String imageUrl;
  final bool hasVoted;
  final String? userName;

  const VotesAvatar({
    super.key,
    required this.imageUrl,
    this.hasVoted = false,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Opacity(
        opacity: hasVoted ? 1.0 : 0.4,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.grey[300],
            ),
            if (hasVoted)
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surface, width: 2),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 12,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
